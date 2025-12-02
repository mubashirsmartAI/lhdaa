<?php

require __DIR__.'/vendor/autoload.php';

$app = require_once __DIR__.'/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use App\Models\Client;
use App\Models\Currency;
use App\Models\ClientCurrency;

echo "Checking for primary currency...\n";

// Check if primary currency already exists
$existingPrimary = ClientCurrency::where('is_primary', 1)->first();

if ($existingPrimary) {
    echo "✓ Primary currency already exists!\n";
    echo "Currency ID: " . $existingPrimary->currency_id . "\n";
    echo "Client Code: " . $existingPrimary->client_code . "\n";
    exit(0);
}

echo "No primary currency found. Setting up...\n";

// Get first client
$client = Client::first();

if (!$client) {
    echo "ERROR: No client found in database. Please create a client first.\n";
    exit(1);
}

echo "Found client: " . $client->name . " (Code: " . $client->code . ")\n";

// Try to find USD currency first, otherwise get first available currency
$currency = Currency::where('iso_code', 'USD')->first();

if (!$currency) {
    $currency = Currency::orderBy('priority', 'desc')
        ->orderBy('id', 'asc')
        ->first();
}

if (!$currency) {
    echo "ERROR: No currency found in database. Please add currencies first.\n";
    exit(1);
}

echo "Using currency: " . $currency->name . " (" . $currency->iso_code . ") - ID: " . $currency->id . "\n";

// Check if client_currency already exists for this client and currency
$existing = ClientCurrency::where('client_code', $client->code)
    ->where('currency_id', $currency->id)
    ->first();

if ($existing) {
    // Update to primary
    $existing->is_primary = 1;
    $existing->doller_compare = $existing->doller_compare ?? 1;
    $existing->save();
    echo "Updated existing currency record to primary.\n";
} else {
    // Create new primary currency
    ClientCurrency::create([
        'client_code' => $client->code,
        'currency_id' => $currency->id,
        'is_primary' => 1,
        'doller_compare' => 1,
    ]);
    echo "Created new primary currency record.\n";
}

echo "✓ Primary currency set successfully!\n";
echo "Client Code: " . $client->code . "\n";
echo "Currency ID: " . $currency->id . "\n";
echo "Currency: " . $currency->name . " (" . $currency->iso_code . ")\n";
