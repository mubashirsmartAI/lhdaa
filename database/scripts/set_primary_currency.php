<?php

/**
 * Script to set primary currency in client_currencies table
 * Run this from command line: php database/scripts/set_primary_currency.php
 * Or access via browser if you set up a route
 */

require __DIR__.'/../../vendor/autoload.php';

$app = require_once __DIR__.'/../../bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use Illuminate\Support\Facades\DB;
use App\Models\Client;
use App\Models\Currency;
use App\Models\ClientCurrency;

try {
    echo "=== Setting Primary Currency ===\n\n";

    // Check if primary currency already exists
    $existingPrimary = DB::table('client_currencies')
        ->where('is_primary', 1)
        ->first();
    
    if ($existingPrimary) {
        echo "✓ Primary currency already exists!\n";
        echo "  Currency ID: " . $existingPrimary->currency_id . "\n";
        echo "  Client Code: " . $existingPrimary->client_code . "\n\n";
        
        // Get currency details
        $currency = DB::table('currencies')->where('id', $existingPrimary->currency_id)->first();
        if ($currency) {
            echo "  Currency: " . $currency->name . " (" . $currency->iso_code . ")\n";
        }
        exit(0);
    }

    echo "No primary currency found. Setting up...\n\n";

    // Get first client
    $client = DB::table('clients')->first();
    
    if (!$client) {
        echo "✗ ERROR: No client found in database.\n";
        echo "  Please create a client first.\n";
        exit(1);
    }

    echo "Found client: " . $client->name . " (Code: " . $client->code . ")\n";

    // Try to find USD currency first, otherwise get first available currency
    $currency = DB::table('currencies')
        ->where('iso_code', 'USD')
        ->first();
    
    if (!$currency) {
        $currency = DB::table('currencies')
            ->orderBy('priority', 'desc')
            ->orderBy('id', 'asc')
            ->first();
    }

    if (!$currency) {
        echo "✗ ERROR: No currency found in database.\n";
        echo "  Please add currencies first.\n";
        exit(1);
    }

    echo "Using currency: " . $currency->name . " (" . $currency->iso_code . ") - ID: " . $currency->id . "\n\n";

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
        echo "✓ Updated existing currency record to primary.\n";
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
        echo "✓ Created new primary currency record.\n";
    }

    echo "\n=== Success! ===\n";
    echo "Client Code: " . $client->code . "\n";
    echo "Currency ID: " . $currency->id . "\n";
    echo "Currency: " . $currency->name . " (" . $currency->iso_code . ")\n";
    echo "Symbol: " . $currency->symbol . "\n";

} catch (\Exception $e) {
    echo "✗ ERROR: " . $e->getMessage() . "\n";
    echo "Stack trace: " . $e->getTraceAsString() . "\n";
    exit(1);
}
