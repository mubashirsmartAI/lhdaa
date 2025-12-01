<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Routing\Route;
use App\Models\Client;
use Illuminate\Support\Facades\Cache;
use Request;
use Config,Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;

class DbChooserApi
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */


    public function handle($request, Closure $next){
       
        config(['auth.guards.api.provider' => 'users']);
        $header = $request->header();

        $database_name = 'royoorders';
        $clientCode = '';
  
        if (!array_key_exists("code", $header)){
            return response()->json(['error' => 'Invalid Code', 'message' => 'Invalid Code'], 401);
        }
        
        $clientCode = $header['code'][0];
        $existRedis = Redis::get($clientCode);
        $client = null;
        
        if(!$existRedis){
            $client = Client::select('name', 'email', 'phone_number', 'is_deleted', 'is_blocked', 'logo', 'company_name', 'company_address', 'status', 'code', 'database_name', 'database_host', 'database_port', 'database_username', 'database_password')
                        ->where('code', $clientCode)
                        ->first();
            if (!$client){
                return response()->json(['error' => 'Invalid Code', 'message' => 'Invalid Code'], 404);
                abort(404);
            }
            Redis::set($clientCode, json_encode($client->toArray()), 'EX', 36000);
            $existRedis = Redis::get($clientCode);
        }
        
        $redisData = json_decode($existRedis, true); // Decode as array for easier handling
        
        // Always ensure we have fresh client data if database_name is missing or invalid
        if (empty($redisData['database_name']) || !isset($redisData['database_name'])) {
            if (!$client) {
                $client = Client::select('name', 'email', 'phone_number', 'is_deleted', 'is_blocked', 'logo', 'company_name', 'company_address', 'status', 'code', 'database_name', 'database_host', 'database_port', 'database_username', 'database_password')
                            ->where('code', $clientCode)
                            ->first();
            }
            if ($client) {
                // Update cache with fresh data
                $clientArray = $client->toArray();
                Redis::set($clientCode, json_encode($clientArray), 'EX', 36000);
                $redisData = $clientArray; // Use fresh data directly
            }
        }
        
        try {
            // Get database name - prefer from client object if available, otherwise from cache
            $dbName = null;
            if ($client && !empty($client->database_name)) {
                $dbName = trim($client->database_name);
            } elseif (isset($redisData['database_name']) && !empty($redisData['database_name'])) {
                $dbName = trim($redisData['database_name']);
            }
            
            // Log for debugging
            \Log::info('DbChooserApi - database_name: ' . ($dbName ?? 'NULL'));
            
            if (empty($dbName)) {
                // Use default database from .env
                $database_name = env('DB_DATABASE', 'royoorders');
                \Log::info('DbChooserApi - Using default database: ' . $database_name);
            } else {
                // Direct check - if database_name starts with 'royo' (case-insensitive), use as-is
                // This handles: royoorders, royo_orders, etc.
                $dbNameLower = strtolower(trim($dbName));
                $startsWithRoyo = (substr($dbNameLower, 0, 4) === 'royo');
                
                \Log::info('DbChooserApi - dbName: [' . $dbName . '], startsWithRoyo: ' . ($startsWithRoyo ? 'true' : 'false'));
                
                if ($startsWithRoyo) {
                    // Already starts with royo, use as-is
                    $database_name = $dbName;
                    \Log::info('DbChooserApi - Final DB name (as-is): ' . $database_name);
                } else {
                    // Add royo_ prefix for suffix-only names
                    $database_name = 'royo_'.$dbName;
                    \Log::info('DbChooserApi - Final DB name (with prefix): ' . $database_name);
                }
            }
            
            $database_host = !empty($redisData['database_host']) ? $redisData['database_host'] : env('DB_HOST', '127.0.0.1');
            $database_port = !empty($redisData['database_port']) ? $redisData['database_port'] : env('DB_PORT', '3306');
            $default = [
              'driver' => env('DB_CONNECTION','mysql'),
              'host' => $database_host,
              'port' => $database_port,
              'database' => $database_name,
              'username' => !empty($redisData['database_username']) ? $redisData['database_username'] : env('DB_USERNAME', 'root'),
              'password' => !empty($redisData['database_password']) ? $redisData['database_password'] : env('DB_PASSWORD', ''),
              'charset' => 'utf8mb4',
              'collation' => 'utf8mb4_unicode_ci',
              'prefix' => '',
              'prefix_indexes' => true,
              'strict' => false,
              'engine' => null
            ];

            if (isset($database_name)) {
                Config::set("database.connections.$database_name", $default);
                Config::set("client_connected", true);
                DB::setDefaultConnection($database_name);
                DB::purge($database_name);
                
                return $next($request);
            }
            abort(404);

        } catch (\Exception $e) {
            throw new HttpException(500, $e->getMessage());
        }
    }
}

