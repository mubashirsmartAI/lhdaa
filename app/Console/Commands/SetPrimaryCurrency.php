<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Client;
use App\Models\Currency;
use App\Models\ClientCurrency;
use Illuminate\Support\Facades\DB;

class SetPrimaryCurrency extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'currency:set-primary';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Set primary currency in client_currencies table if not exists';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->info('Checking for primary currency...');

        // Check if primary currency already exists
        $existingPrimary = ClientCurrency::where('is_primary', 1)->first();
        
        if ($existingPrimary) {
            $this->info('Primary currency already exists!');
            $this->info('Currency ID: ' . $existingPrimary->currency_id);
            $this->info('Client Code: ' . $existingPrimary->client_code);
            return 0;
        }

        $this->warn('No primary currency found. Setting up...');

        // Get first client
        $client = Client::first();
        
        if (!$client) {
            $this->error('No client found in database. Please create a client first.');
            return 1;
        }

        $this->info('Found client: ' . $client->name . ' (Code: ' . $client->code . ')');

        // Try to find USD currency first, otherwise get first available currency
        $currency = Currency::where('iso_code', 'USD')->first();
        
        if (!$currency) {
            $currency = Currency::orderBy('priority', 'desc')
                ->orderBy('id', 'asc')
                ->first();
        }

        if (!$currency) {
            $this->error('No currency found in database. Please add currencies first.');
            return 1;
        }

        $this->info('Using currency: ' . $currency->name . ' (' . $currency->iso_code . ') - ID: ' . $currency->id);

        // Check if client_currency already exists for this client and currency
        $existing = ClientCurrency::where('client_code', $client->code)
            ->where('currency_id', $currency->id)
            ->first();

        if ($existing) {
            // Update to primary
            $existing->is_primary = 1;
            $existing->doller_compare = $existing->doller_compare ?? 1;
            $existing->save();
            $this->info('Updated existing currency record to primary.');
        } else {
            // Create new primary currency
            ClientCurrency::create([
                'client_code' => $client->code,
                'currency_id' => $currency->id,
                'is_primary' => 1,
                'doller_compare' => 1,
            ]);
            $this->info('Created new primary currency record.');
        }

        $this->info('✓ Primary currency set successfully!');
        $this->info('Client Code: ' . $client->code);
        $this->info('Currency ID: ' . $currency->id);
        $this->info('Currency: ' . $currency->name . ' (' . $currency->iso_code . ')');

        return 0;
    }
}
