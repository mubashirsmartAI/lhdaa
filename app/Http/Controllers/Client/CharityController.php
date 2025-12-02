<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\Charity;
use App\Models\CharityDonation;
use App\Models\ClientCurrency;
use App\Models\ClientPreference;
use App\Models\CsvVendorImport;
use App\Models\Payment;
use App\Models\User;
use App\Models\Vendor;
use App\Models\VendorDocs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class CharityController extends Controller
{
    public function index()
    {
        // $data = Charity::all();
        $data = Charity::paginate(10);
        return view('backend.charity.index', compact('data'));
    }

    public function add()
    {
        return view('backend.charity.add-charity');
    }

    public function store(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'name' => 'required|string|max:150',
                'desc' => 'nullable|string',
                'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
                'address' => 'required|string',
                'email' => 'required|email|max:255|unique:charities,email',
                'website' => 'nullable|url',
                'phone' => 'required|string|max:20|unique:charities,phone',
                'dial_code' => 'required|string|max:10',
                'lat' => 'nullable|numeric',
                'long' => 'nullable|numeric',
                'password' => 'required|min:8|confirmed'
            ], [
                'name.required' => 'Charity name is required.',
                'address.required' => 'Address is required.',
                'email.required' => 'Email is required.',
                'email.email' => 'Please enter a valid email address.',
                'email.unique' => 'This email is already registered.',
                'phone.required' => 'Phone number is required.',
                'phone.unique' => 'This phone number is already registered.',
                'dial_code.required' => 'Dial code is required.',
                'password.required' => 'Password is required.',
                'password.min' => 'Password must be at least 8 characters.',
                'password.confirmed' => 'Password confirmation does not match.',
            ]);
            
            DB::beginTransaction();

            $charity = new Charity();
            $charity->name = $request->name;
            $charity->desc = $request->desc;
            $charity->address = $request->address;
            $charity->email = $request->email;
            $charity->website = $request->website;
            $charity->phone = $request->phone;
            $charity->dial_code = $request->dial_code;
            $charity->latitude = $request->lat;
            $charity->longitude = $request->long;
            $charity->password = Hash::make($request->password);

            if ($request->hasFile('logo')) {
                $file = $request->file('logo');
                $path = Storage::disk('s3')->putFile('/charity', $file, 'public');
                $charity->logo = Storage::disk('s3')->url($path);
            }

            $charity->save();

            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->description = $request->desc;
            $user->phone_number = $request->phone;
            $user->dial_code = $request->dial_code;
            $user->role_id = 4;
            $user->status = 1;
            $user->is_admin = 1;
            $user->password = Hash::make($request->password);
            $user->charity_id = $charity->id;
            
            // Add client_code if user is authenticated
            if (Auth::check() && Auth::user()->code) {
                $user->code = Auth::user()->code;
            }
            
            $user->save();

            if ($user) {
                $user->assignRole('Charity');
            }

            DB::commit();

            return redirect()->route('charity.index')->with('success', 'Charity and user added successfully.');
        } catch (\Illuminate\Validation\ValidationException $e) {
            DB::rollBack();
            Log::error('Charity validation error: ' . json_encode($e->errors()));
            return redirect()->back()
                ->withErrors($e->errors())
                ->withInput();
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Charity store error: ' . $e->getMessage());
            Log::error('Stack trace: ' . $e->getTraceAsString());
            return redirect()->back()
                ->with('error', 'Failed to add charity: ' . $e->getMessage())
                ->withInput();
        }
    }

    public function destroy($domain = '', $id)
    {
        $charity = Charity::findOrFail($id);

        if ($charity->delete()) {
            return redirect()->route('charity.index')->with('success', 'Charity deleted successfully.');
        } else {
            return redirect()->route('charity.index')->with('error', 'Failed to delete charity.');
        }
    }

    public function edit($domain = '', $id)
    {
        $charity = Charity::findOrFail($id);
        return view('backend.charity.edit-charity', compact('charity'));
    }

    public function update(Request $request, $domain = '', $id)
    {
        if (!auth()->user()->can('charity-add') && !auth()->user()->is_superadmin) {
            return redirect('client/dashboard')->with('error', 'You do not have permission to do this task.');
        }
        
        $validatedData = $request->validate([
            'name' => 'required|string|max:150',
            'desc' => 'nullable|string',
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'address' => 'required|string',
            'email' => 'required|email|unique:charities,email,' . $id . ',id',
            'website' => 'nullable|url',
            'phone' => 'required|string|max:20|unique:charities,phone,' . $id . ',id',
            'dial_code' => 'required|string|max:10',
            'lat' => 'nullable|numeric',
            'long' => 'nullable|numeric',
        ]);
        
        $charity = Charity::findOrFail($id);

        // Handle logo upload
        if ($request->hasFile('logo')) {
            $file = $request->file('logo');
            $logoPath = Storage::disk('s3')->putFile('/charity', $file, 'public');
            $validatedData['logo'] = Storage::disk('s3')->url($logoPath);
        } else {
            $validatedData['logo'] = $charity->logo; // Retain the existing logo if no file is uploaded
        }
        
        $charity->update($validatedData);

        return redirect()->route('charity.index')->with('success', 'Charity updated successfully.');
    }

    public function view($domain = '', $id)
    {
        $charity = Charity::with('beneficiaries')->findOrFail($id);
        return view('backend.charity.view-charity', compact('charity'));
    }

    public function charityDonationindex()
    {
        $clientCurrency = ClientCurrency::select('currency_id')->where('is_primary', 1)->with('currency')->first();
        $charityId = auth()->user()->charity_id;
        $charity = Charity::findOrFail($charityId);
        $charityDonations = CharityDonation::where('charity_id', $charityId)->paginate(10);

        return view('backend.charity.charity-donation.index', compact(['charity', 'charityDonations', 'clientCurrency']));
    }

    public function addDonation(Request $request)
    {
        $request->validate([
            'amount' => 'required|numeric|min:1',
        ]);

        CharityDonation::create([
            'charity_id' => auth()->user()->charity_id,
            'amount' => $request->amount,
        ]);

        return response()->json(['status' => 'success', 'message' => 'Donation amount added successfully!']);
    }

    public function deleteCharityDonation(Request $request)
    {
        $donation = CharityDonation::where('id', $request->id)->where('charity_id', auth()->user()->charity_id)->first();
        if ($donation) {
            $donation->delete();
            return response()->json(['status' => 'success', 'message' => 'Donation amount deleted successfully!']);
        }

        return response()->json(['status' => 'error', 'message' => 'Donation amount not found!']);
    }

    public function toggleDonation(Request $request)
    {
        $request->validate([
            'accept_donations' => 'required|boolean',
        ]);
    
        $charityId = auth()->user()->charity_id;
        
        $charity = Charity::findOrFail($charityId);
        $charity->update([
            'accept_donations' => $request->accept_donations
        ]);
    
        return response()->json([
            'status' => 'success',
            'message' => 'Donation settings updated successfully!'
        ]);
    }
    
    public function getCharityDonations($domain = '', $charityId)
    {
        $clientCurrency = ClientCurrency::select('currency_id')->where('is_primary', 1)->with('currency')->first();
        $currencySymbol = $clientCurrency->currency->symbol;
        $charity = Charity::with('charityDonations')->findOrFail($charityId);
        return response()->json(['charity' => $charity, 'donations' => $charity->charityDonations ?? [], 'currencySymbol' => $currencySymbol]);
    }

    public function getDonationsList()
    {
        $user = auth()->user();
        
        $charityId = $user->charity_id ?? null;

        $clientCurrency = ClientCurrency::where('is_primary', 1)
            ->with(['currency:id,symbol'])
            ->first();
        if($user->is_superadmin == 1){
            $payments = Payment::with('user')->where('type', 'charity')->orderBy('id', 'DESC')->paginate(10);
        }else{
            $payments = Payment::with('user')->where('type', 'charity')->where('charity_id', $charityId)->orderBy('id', 'desc')->paginate(10);
        }
        
        return view('backend.charity.charity-donation.donation-index', compact('payments', 'clientCurrency'));
    }

    public function showRegistrationForm()
    {
        return view('frontend.charity.register');
    }

    public function register(Request $request)
    {
        $rules = [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email|max:255',
            'password' => 'required|string|min:8',
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'desc' => 'nullable|string|max:1000',
            'phone' => [
                'required',
                'string',
                'regex:/^\+?\d{1,4}?[\s.-]?\(?\d{1,4}?\)?[\s.-]?\d{1,4}[\s.-]?\d{1,4}[\s.-]?\d{1,4}$/'
            ],
            'dial_code' => 'required|string|max:10',
            'address' => 'required|string|max:500',
            'website' => 'nullable|url|max:255',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        DB::beginTransaction();

        try {
            $charity = new Charity();
            $charity->name = $request->name;
            $charity->desc = $request->desc;
            $charity->address = $request->address;
            $charity->email = $request->email;
            $charity->website = $request->website;
            $charity->phone = $request->phone_number;
            $charity->dial_code = $request->dialcode;
            $charity->password = Hash::make($request->password);

            if ($request->hasFile('logo')) {
                $file = $request->file('logo');
                $path = Storage::disk('s3')->putFile('/charity', $file, 'public');
                $charity->logo = Storage::disk('s3')->url($path);
            }

            $charity->save();

            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->description = $request->desc;
            $user->phone_number = $request->phone_number;
            $user->dial_code = $request->dialcode;
            $user->role_id = 4;
            $user->status = 1;
            $user->is_admin = 1;
            $user->password = Hash::make($request->password);
            $user->charity_id = $charity->id;

            $user->save();
            $user->assignRole('Charity');

            // Optional: login the user
            Auth::login($user);

            DB::commit();

            session()->flash('success', 'You have successfully signed up as a charity.');
            return redirect()->route('customer.login');

        } catch (\Exception $e) {
            report($e);
            DB::rollBack();
            return redirect()->back()
                ->withErrors(['description' => 'Something went wrong. ' . $e->getMessage()])
                ->withInput();
        }
    }
}
