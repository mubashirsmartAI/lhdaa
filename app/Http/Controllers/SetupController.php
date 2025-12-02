<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Client;
use App\Models\Currency;
use App\Models\ClientCurrency;

class SetupController extends Controller
{
    public function setPrimaryCurrency()
    {
        try {
            $output = [];
            $output[] = "<h2>Setting Primary Currency</h2>";
            $output[] = "<pre>";
            
            // Check if primary currency already exists
            $existingPrimary = DB::table('client_currencies')
                ->where('is_primary', 1)
                ->first();
            
            if ($existingPrimary) {
                $output[] = "✓ Primary currency already exists!";
                $output[] = "Currency ID: " . $existingPrimary->currency_id;
                $output[] = "Client Code: " . $existingPrimary->client_code;
                
                $currency = DB::table('currencies')->where('id', $existingPrimary->currency_id)->first();
                if ($currency) {
                    $output[] = "Currency: " . $currency->name . " (" . $currency->iso_code . ")";
                }
                $output[] = "</pre>";
                return response(implode("\n", $output));
            }
            
            $output[] = "No primary currency found. Setting up...";
            $output[] = "";
            
            // Get first client
            $client = DB::table('clients')->first();
            
            if (!$client) {
                $output[] = "✗ ERROR: No client found in database.";
                $output[] = "</pre>";
                return response(implode("\n", $output), 500);
            }
            
            $output[] = "Found client: " . $client->name . " (Code: " . $client->code . ")";
            
            // Try to find USD currency first, otherwise get first available currency
            $currency = DB::table('currencies')->where('iso_code', 'USD')->first();
            
            if (!$currency) {
                $currency = DB::table('currencies')
                    ->orderBy('priority', 'desc')
                    ->orderBy('id', 'asc')
                    ->first();
            }
            
            if (!$currency) {
                $output[] = "✗ ERROR: No currency found in database.";
                $output[] = "</pre>";
                return response(implode("\n", $output), 500);
            }
            
            $output[] = "Using currency: " . $currency->name . " (" . $currency->iso_code . ") - ID: " . $currency->id;
            $output[] = "";
            
            // First, set all existing currencies for this client to not primary
            DB::table('client_currencies')
                ->where('client_code', $client->code)
                ->update(['is_primary' => 0]);
            
            // Check if client_currency already exists for this client and currency
            $existing = DB::table('client_currencies')
                ->where('client_code', $client->code)
                ->where('currency_id', $currency->id)
                ->first();
            
            if ($existing) {
                // Update to primary
                DB::table('client_currencies')
                    ->where('client_code', $client->code)
                    ->where('currency_id', $currency->id)
                    ->update([
                        'is_primary' => 1,
                        'doller_compare' => $existing->doller_compare ?? 1,
                        'updated_at' => now(),
                    ]);
                $output[] = "✓ Updated existing currency record to primary.";
            } else {
                // Create new primary currency
                DB::table('client_currencies')->insert([
                    'client_code' => $client->code,
                    'currency_id' => $currency->id,
                    'is_primary' => 1,
                    'doller_compare' => 1,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
                $output[] = "✓ Created new primary currency record.";
            }
            
            // Verify it was set
            $verify = DB::table('client_currencies')
                ->where('is_primary', 1)
                ->first();
            
            if ($verify) {
                $output[] = "";
                $output[] = "=== SUCCESS! ===";
                $output[] = "✓ Primary currency verified and set!";
                $output[] = "Client Code: " . $client->code;
                $output[] = "Currency ID: " . $currency->id;
                $output[] = "Currency: " . $currency->name . " (" . $currency->iso_code . ")";
                $output[] = "Symbol: " . $currency->symbol;
            } else {
                $output[] = "";
                $output[] = "⚠ WARNING: Currency was inserted but verification failed.";
            }
            
            $output[] = "</pre>";
            return response(implode("\n", $output));
            
        } catch (\Exception $e) {
            return response("<pre>ERROR: " . $e->getMessage() . "\n\n" . $e->getTraceAsString() . "</pre>", 500);
        }
    }
}
