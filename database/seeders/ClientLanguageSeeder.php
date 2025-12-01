<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ClientLanguageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        DB::table('client_languages')->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        $languages = DB::table('languages')->select('id')->orderBy('id')->get();

        $payload = [];
        $timestamp = now();
        foreach ($languages as $index => $language) {
            $payload[] = [
                'client_code' => null,
                'language_id' => $language->id,
                'is_primary' => $index === 0 ? 1 : 0,
                'is_active' => 1,
                'created_at' => $timestamp,
                'updated_at' => $timestamp,
            ];
        }

        if (! empty($payload)) {
            foreach (array_chunk($payload, 1000) as $chunk) {
                DB::table('client_languages')->insert($chunk);
            }
        }
    }
}


