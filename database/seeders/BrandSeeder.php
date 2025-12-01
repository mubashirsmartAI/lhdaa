<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BrandSeeder extends Seeder
{
    /**
     * Provide a handful of retail brands so the home page “Brands”
     * carousel has meaningful data.
     */
    public function run(): void
    {
        DB::table('brand_categories')->delete();
        DB::table('brand_translations')->delete();
        DB::table('brands')->delete();

        $now = Carbon::now();

        $brands = [
            ['id' => 1, 'title' => 'Fresh Valley', 'image' => 'default/default_image.png', 'image_banner' => null, 'position' => 1, 'status' => 1, 'created_at' => $now, 'updated_at' => $now],
            ['id' => 2, 'title' => 'Harvest Choice', 'image' => 'default/default_image.png', 'image_banner' => null, 'position' => 2, 'status' => 1, 'created_at' => $now, 'updated_at' => $now],
            ['id' => 3, 'title' => 'Urban Grind', 'image' => 'default/default_image.png', 'image_banner' => null, 'position' => 3, 'status' => 1, 'created_at' => $now, 'updated_at' => $now],
            ['id' => 4, 'title' => 'Coastal Care', 'image' => 'default/default_image.png', 'image_banner' => null, 'position' => 4, 'status' => 1, 'created_at' => $now, 'updated_at' => $now],
            ['id' => 5, 'title' => 'Metro Bakes', 'image' => 'default/default_image.png', 'image_banner' => null, 'position' => 5, 'status' => 1, 'created_at' => $now, 'updated_at' => $now],
        ];

        DB::table('brands')->insert($brands);

        $brandTranslations = [];
        foreach ($brands as $brand) {
            $brandTranslations[] = [
                'brand_id' => $brand['id'],
                'language_id' => 1,
                'title' => $brand['title'],
                'created_at' => $now,
                'updated_at' => $now,
            ];
        }
        DB::table('brand_translations')->insert($brandTranslations);

        $brandCategories = [
            ['brand_id' => 1, 'category_id' => 4, 'created_at' => $now, 'updated_at' => $now],
            ['brand_id' => 2, 'category_id' => 8, 'created_at' => $now, 'updated_at' => $now],
            ['brand_id' => 2, 'category_id' => 9, 'created_at' => $now, 'updated_at' => $now],
            ['brand_id' => 3, 'category_id' => 3, 'created_at' => $now, 'updated_at' => $now],
            ['brand_id' => 4, 'category_id' => 5, 'created_at' => $now, 'updated_at' => $now],
            ['brand_id' => 5, 'category_id' => 7, 'created_at' => $now, 'updated_at' => $now],
        ];

        DB::table('brand_categories')->insert($brandCategories);
    }
}

