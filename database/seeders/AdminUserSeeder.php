<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::withTrashed()->where('email', 'admin@cbl.com')->first();
        
        if ($user) {
            // If user exists (even if soft deleted), restore and update
            if ($user->trashed()) {
                $user->restore();
            }
            $user->update([
                'name' => 'Super Admin',
                'dial_code' => 1,
                'phone_number' => null,
                'password' => Hash::make('password'),
                'is_email_verified' => 1,
                'is_phone_verified' => 1,
                'status' => 1,
                'is_superadmin' => 1,
                'is_admin' => 1,
                'deleted_at' => null, // Ensure not soft deleted
            ]);
        } else {
            // Create new user
            User::create([
                'name' => 'Super Admin',
                'email' => 'admin@cbl.com',
                'dial_code' => 1,
                'phone_number' => null,
                'password' => Hash::make('password'),
                'is_email_verified' => 1,
                'is_phone_verified' => 1,
                'status' => 1,
                'is_superadmin' => 1,
                'is_admin' => 1,
            ]);
        }
    }
}

