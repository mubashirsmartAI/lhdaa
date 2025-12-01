<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Hash;
use App\Models\Client;
use App\Models\Country;

class CreateDefaultClient extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'client:create-default';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create a default client record for API usage';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        // Check if client already exists
        $client = Client::first();
        
        if ($client) {
            $this->info('Client already exists with code: ' . $client->code);
            
            // Update database credentials if not set
            $updated = false;
            if (empty($client->database_name)) {
                $client->database_name = env('DB_DATABASE', 'royoorders');
                $updated = true;
            }
            if (empty($client->database_host)) {
                $client->database_host = env('DB_HOST', '127.0.0.1');
                $updated = true;
            }
            if (empty($client->database_port)) {
                $client->database_port = env('DB_PORT', '3306');
                $updated = true;
            }
            if (empty($client->database_username)) {
                $client->database_username = env('DB_USERNAME', 'root');
                $updated = true;
            }
            if (empty($client->database_password)) {
                $client->database_password = env('DB_PASSWORD', '');
                $updated = true;
            }
            
            if ($updated) {
                $client->save();
                $this->info('Client database credentials updated!');
            }
            
            $this->info('Client Code: ' . $client->code);
            $this->info('Database Name: ' . ($client->database_name ?? 'Not set'));
            return 0;
        }
        
        // Get first country or default
        $country = Country::first();
        $countryId = $country ? $country->id : null;
        
        // Generate a unique code
        $code = substr(md5(uniqid(rand(), true)), 0, 6);
        
        // Create default client
        $client = Client::create([
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
            'database_name' => env('DB_DATABASE', 'royoorders'),
            'database_host' => env('DB_HOST', '127.0.0.1'),
            'database_port' => env('DB_PORT', '3306'),
            'database_username' => env('DB_USERNAME', 'root'),
            'database_password' => env('DB_PASSWORD', ''),
        ]);
        
        $this->info('Default client created successfully!');
        $this->info('Client Code: ' . $code);
        $this->info('Database Name: ' . $client->database_name);
        $this->info('Use this code in the "code" header when making API requests.');
        
        return 0;
    }
}
