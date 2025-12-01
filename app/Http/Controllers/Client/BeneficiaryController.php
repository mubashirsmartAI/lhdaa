<?php
namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Models\BeneficiarieOrder;
use App\Models\Beneficiary;
use App\Models\Charity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class BeneficiaryController extends Controller
{
    // Show the list of beneficiaries for a charity
    public function index(Request $request, $domain = '', $charity_id)
    {
        $charity = Charity::findOrFail($charity_id);

        $beneficiariesData = $charity->beneficiaries()->paginate(10);
        return view('backend.beneficiary.index', compact('charity', 'beneficiariesData'));
    }

    public function add($domain = '', $id)
    {
        $charity = Charity::findOrFail($id);
        
        return view('backend.beneficiary.add-beneficiary', compact('charity'));
    }

    // Store a new beneficiary
    public function store(Request $request)
    {
        $user = auth()->user();
        
        $validatedData = $request->validate([
            'name' => 'required|string|max:150',
            'email' => 'nullable|email|unique:beneficiaries,email',
            'phone' => 'required|string|max:20',
            'dial_code' => 'required|string|max:10',
            'description' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'charity_id' => 'required|exists:charities,id',
        ]);

        $existingBeneficiary = Beneficiary::where('phone', $request->phone)
                                        ->where('dial_code', $request->dial_code)
                                        ->first();
        
        if ($existingBeneficiary) {
            if ($request->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => 'A beneficiary with this phone number already exists.'
                ]);
            }
            return redirect()->back()
                ->withInput()
                ->withErrors(['phone' => 'A beneficiary with this phone number already exists.']);
        }

        $beneficiary = new Beneficiary();
        $beneficiary->name = $request->name;
        $beneficiary->email = $request->email;
        $beneficiary->phone = $request->phone;
        $beneficiary->dial_code = $request->dial_code;
        $beneficiary->description = $request->description;
        $beneficiary->charity_id = $request->charity_id;

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $path = Storage::disk('s3')->putFile('/beneficiaries', $file, 'public');
            $beneficiary->image = Storage::disk('s3')->url($path);
        }
        
        $beneficiary->save();

        if ($request->ajax()) {
            return response()->json([
                'success' => true,
                'message' => 'Beneficiary added successfully',
                'beneficiary' => $beneficiary
            ]);
        }

        if($user->role_id == 4){
            return redirect()->route('beneficiary.index', ['charity_id' => $beneficiary->charity_id])
                        ->with('success', 'Beneficiary added successfully');
        }else{
            return redirect()->route('charity.view', ['id' => $beneficiary->charity_id])
                        ->with('success', 'Beneficiary added successfully');
        }
    }

    // Show form to edit a beneficiary
    public function edit($domain = '', $id)
    {
        $beneficiary = Beneficiary::findOrFail($id);
        return view('backend.beneficiary.edit-beneficiary', compact('beneficiary'));
    }

    public function update(Request $request, $domain = '', $id)
    {
        $user = auth()->user();
        $request->validate([
            'name' => 'required|string|max:150',
            'email' => [
                'nullable',
                'email',
                Rule::unique('beneficiaries')->ignore($id),
            ],
            'phone' => 'required|string|max:20',
            'dial_code' => 'required|string|max:10',
            'description' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $existingBeneficiary = Beneficiary::where('phone', $request->phone)
                                        ->where('dial_code', $request->dial_code)
                                        ->where('id', '!=', $id)
                                        ->first();

        if ($existingBeneficiary) {
            return redirect()->back()
                ->withInput()
                ->withErrors(['phone' => 'A beneficiary with this phone number is already exists.']);
        }
        

        $beneficiary = Beneficiary::findOrFail($id);
        $beneficiary->name = $request->name;
        $beneficiary->email = $request->email;
        $beneficiary->phone = $request->phone;
        $beneficiary->dial_code = $request->dial_code;
        $beneficiary->description = $request->description;

        if ($request->hasFile('image')) {

            $file = $request->file('image');
            $path = Storage::disk('s3')->putFile('/beneficiaries', $file, 'public');
            $beneficiary->image = Storage::disk('s3')->url($path);
        }

        $beneficiary->save();

        if($user->role_id == 4){
            return redirect()->route('beneficiary.index', ['charity_id' => $beneficiary->charity_id])
                        ->with('success', 'Beneficiary updated successfully');
        }else{
            return redirect()->route('charity.view', ['id' => $beneficiary->charity_id])
                        ->with('success', 'Beneficiary updated successfully');
        }
    }

    // Delete a beneficiary
    public function destroy($domain = '',$id)
    {
        $user = auth()->user();
        
        $beneficiary = Beneficiary::findOrFail($id);
        $charity_id = $beneficiary->charity_id;
        $beneficiary->delete();

        if($user->role_id == 4){
            return redirect()->route('beneficiary.index', ['charity_id' => $charity_id])->with('success', 'Beneficiary deleted successfully');
        }else{
            return redirect()->route('charity.view', ['id' => $charity_id])->with('success', 'Beneficiary deleted successfully');
        }
    }

    public function assignBeneficiary(Request $request)
    {
        $request->validate([
            'name' => 'required|min:3|max:255',
            'email' => 'nullable|email|regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/i|regex:/\.com$/i|max:255',
            'phone' => 'required|string|regex:/^[0-9]{6,15}$/',
            'order_id' => 'required|integer',
            'charity_id' => 'required|integer'
        ]);
        
        $beneficiary = Beneficiary::create([
            'name' => $request->name,
            'order_id' => $request->order_id,
            'charity_id' => $request->charity_id,
            'email' => $request->email,
            'dial_code' => $request->dial_code,
            'phone' => $request->phone,
            'description' => $request->description
        ]);

        if ($beneficiary) {
            return response()->json([
                'status' => 'success',
                'message' => 'Beneficiary assigned successfully!'
            ], 200);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to assign beneficiary. Please try again.'
            ], 500);
        }
    }

    public function markComplete(Request $request)
    {
        $beneficiaryOrder = BeneficiarieOrder::where('order_id', $request->order_id)
                        ->where('beneficiary_id', $request->beneficiary_id)
                        ->first();
       
        if ($beneficiaryOrder) {
            $beneficiaryOrder->is_completed = 1;
            $beneficiaryOrder->save();

            return response()->json([
                'success' => true, 
                'message' => 'Order marked as complete',
                'status' => $beneficiaryOrder->is_completed
            ]);
        }

        return response()->json([
            'success' => false, 
            'message' => 'Order not found or charity does not match'
        ]);
    }

    public function getBeneficiariesByCharity($domain = '', $charity_id)
    {
        try {
            $charity = Charity::findOrFail($charity_id);
            $beneficiaries = $charity->beneficiaries()->get();
            
            return response()->json([
                'status' => 'success',
                'beneficiaries' => $beneficiaries
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to retrieve beneficiaries: ' . $e->getMessage()
            ], 500);
        }
    }

    public function assignBeneficiaryToOrder(Request $request)
    {
        try {
            $request->validate([
                'order_id' => 'required|integer',
                'beneficiary_id' => 'required|integer',
                'charity_id' => 'required|integer'
            ]);

            $beneficiary = Beneficiary::findOrFail($request->beneficiary_id);
            
            if ($beneficiary->charity_id != $request->charity_id) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Beneficiary does not belong to the specified charity'
                ], 400);
            }

            $beneficiariesOrder = new BeneficiarieOrder();
            $beneficiariesOrder->beneficiary_id = $beneficiary->id;
            $beneficiariesOrder->order_id = $request->order_id;
            $beneficiariesOrder->is_completed = 0;
            $beneficiariesOrder->save();
            
            return response()->json([
                'status' => 'success',
                'message' => 'Beneficiary "' . $beneficiary->name . '" assigned to order successfully'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to assign beneficiary: ' . $e->getMessage()
            ], 500);
        }
    }
}
