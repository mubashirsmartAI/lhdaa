<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Client;
use Illuminate\Support\Facades\Redis;

class TestClientDatabase extends Command
{
    protected $signature = 'client:test-db {code}';
    protected $description = 'Test client database configuration';

    public function handle()
    {
        $code = $this->argument('code');
        
        $client = Client::where('code', $code)->first();
        
        if (!$client) {
            $this->error('Client not found!');
            return 1;
        }
        
        $this->info('Client Code: ' . $client->code);
        $this->info('Database Name in DB: ' . ($client->database_name ?? 'NULL'));
        
        // Check Redis cache
        $cached = Redis::get($code);
        if ($cached) {
            $cachedData = json_decode($cached);
            $this->info('Database Name in Cache: ' . ($cachedData->database_name ?? 'NULL'));
            
            // Test the logic
            $dbName = $cachedData->database_name ?? null;
            if (empty($dbName)) {
                $finalName = env('DB_DATABASE', 'royoorders');
                $this->info('Final DB Name (empty): ' . $finalName);
            } elseif (strpos($dbName, 'royo') === 0 || strpos($dbName, 'royo_') === 0) {
                $finalName = $dbName;
                $this->info('Final DB Name (has royo): ' . $finalName);
            } else {
                $finalName = 'royo_'.$dbName;
                $this->info('Final DB Name (with prefix): ' . $finalName);
            }
        } else {
            $this->warn('No cached data found');
        }
        
        return 0;
    }
}

