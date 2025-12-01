<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\Client;
use App\Models\Country;

class DefaultClientSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Check if client already exists
        $existingClient = Client::first();
        
        if (!$existingClient) {
            // Get first country or default
            $country = Country::first();
            $countryId = $country ? $country->id : null;
            
            // Generate a unique code
            $code = substr(md5(uniqid(rand(), true)), 0, 6);
            
            // Create default client
            Client::create([
                'name' => 'Default Client',
                'email' => 'admin@cbl.com',
                'phone_number' => '1234567890',
                'password' => Hash::make('password'),
                'code' => $code,
                'company_name' => 'Default Company',
                'company_address' => 'Default Address',
                'country_id' => $countryId,
                'timezone' => 'Asia/Kolkata',
                'status' => 1,
                'is_deleted' => 0,
                'is_blocked' => 0,
            ]);
        }
    }
}

