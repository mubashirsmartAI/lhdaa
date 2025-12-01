<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    /**
     * Seed five well-described products with variants so the home page
     * widgets (featured/new/spotlight) always have content.
     */
    public function run(): void
    {
        DB::table('product_variant_sets')->delete();
        DB::table('product_variants')->delete();
        DB::table('product_translations')->delete();
        DB::table('product_categories')->delete();
        DB::table('products')->delete();

        $now = Carbon::now();

        $products = [
            [
                'id' => 1,
                'sku' => 'FOOD-001',
                'title' => 'Woodfired Pizza',
                'url_slug' => 'woodfired-pizza',
                'vendor_id' => 1,
                'brand_id' => 1,
                'category_id' => 3,
                'type_id' => 1,
                'description' => 'Hand stretched sourdough base topped with blistered tomatoes, buffalo mozzarella, and basil pesto.',
                'is_new' => 1,
                'is_featured' => 1,
                'is_live' => 1,
                'is_physical' => 1,
                'Requires_last_mile' => 1,
                'spotlight_deals' => 1,
                'replaceable' => 0,
                'returnable' => 0,
                'tax_category_id' => 1,
                'minimum_order_count' => 1,
                'individual_delivery_fee' => 0,
                'security_amount' => 0,
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'id' => 2,
                'sku' => 'FOOD-002',
                'title' => 'Chef Salad Kit',
                'url_slug' => 'chef-salad-kit',
                'vendor_id' => 1,
                'brand_id' => 2,
                'category_id' => 7,
                'type_id' => 1,
                'description' => 'Crisp greens, grilled chicken, pickled onions, and citrus dressing packed fresh every morning.',
                'is_new' => 1,
                'is_featured' => 0,
                'is_live' => 1,
                'is_physical' => 1,
                'Requires_last_mile' => 1,
                'spotlight_deals' => 0,
                'replaceable' => 0,
                'returnable' => 0,
                'tax_category_id' => 1,
                'minimum_order_count' => 1,
                'individual_delivery_fee' => 0,
                'security_amount' => 0,
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'id' => 3,
                'sku' => 'GROC-101',
                'title' => 'Organic Fruit Basket',
                'url_slug' => 'organic-fruit-basket',
                'vendor_id' => 2,
                'brand_id' => 1,
                'category_id' => 9,
                'type_id' => 1,
                'description' => 'Seasonal mix of certified organic berries, melons, and stone fruit curated for weekly deliveries.',
                'is_new' => 0,
                'is_featured' => 1,
                'is_live' => 1,
                'is_physical' => 1,
                'Requires_last_mile' => 1,
                'spotlight_deals' => 0,
                'replaceable' => 0,
                'returnable' => 0,
                'tax_category_id' => 1,
                'minimum_order_count' => 1,
                'individual_delivery_fee' => 0,
                'security_amount' => 0,
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'id' => 4,
                'sku' => 'PHAR-210',
                'title' => 'Immunity Essentials Pack',
                'url_slug' => 'immunity-essentials-pack',
                'vendor_id' => 3,
                'brand_id' => 4,
                'category_id' => 5,
                'type_id' => 1,
                'description' => 'Combination of multivitamins, zinc, and herbal supplements sourced from licensed distributors.',
                'is_new' => 0,
                'is_featured' => 0,
                'is_live' => 1,
                'is_physical' => 1,
                'Requires_last_mile' => 1,
                'spotlight_deals' => 1,
                'replaceable' => 0,
                'returnable' => 0,
                'tax_category_id' => 1,
                'minimum_order_count' => 1,
                'individual_delivery_fee' => 0,
                'security_amount' => 0,
                'created_at' => $now,
                'updated_at' => $now,
            ],
            [
                'id' => 5,
                'sku' => 'GROC-305',
                'title' => 'Cold Brew Concentrate',
                'url_slug' => 'cold-brew-concentrate',
                'vendor_id' => 4,
                'brand_id' => 3,
                'category_id' => 4,
                'type_id' => 1,
                'description' => 'Slow steeped single-origin coffee concentrate with tasting notes of caramel and cocoa.',
                'is_new' => 1,
                'is_featured' => 1,
                'is_live' => 1,
                'is_physical' => 1,
                'Requires_last_mile' => 1,
                'spotlight_deals' => 0,
                'replaceable' => 0,
                'returnable' => 0,
                'tax_category_id' => 1,
                'minimum_order_count' => 1,
                'individual_delivery_fee' => 0,
                'security_amount' => 0,
                'created_at' => $now,
                'updated_at' => $now,
            ],
        ];

        DB::table('products')->insert($products);

        $translations = [];
        $variants = [];
        $productCategories = [];
        $variantId = 1;

        foreach ($products as $index => $product) {
            $translations[] = [
                'product_id' => $product['id'],
                'language_id' => 1,
                'title' => $product['title'],
                'meta_title' => $product['title'] . ' | ' . $product['sku'],
                'meta_keyword' => Str::slug($product['title'], ' '),
                'meta_description' => $product['description'],
                'created_at' => $now,
                'updated_at' => $now,
            ];

            $price = 30 + ($index * 8);
            $variants[] = [
                'id' => $variantId,
                'product_id' => $product['id'],
                'sku' => $product['sku'] . '-STD',
                'title' => $product['title'] . ' Standard',
                'price' => $price,
                'compare_at_price' => $price + 6,
                'cost_price' => $price - 10,
                'quantity' => 100,
                'status' => 1,
                'currency_id' => 1,
                'tax_category_id' => 1,
                'barcode' => 'BAR-' . str_pad((string) $product['id'], 4, '0', STR_PAD_LEFT),
                'position' => 1,
                'inventory_policy' => 'continue',
                'created_at' => $now,
                'updated_at' => $now,
            ];

            $variantId++;

            $productCategories[] = [
                'product_id' => $product['id'],
                'category_id' => $product['category_id'],
                'created_at' => $now,
                'updated_at' => $now,
            ];
        }

        DB::table('product_translations')->insert($translations);
        DB::table('product_variants')->insert($variants);
        DB::table('product_categories')->insert($productCategories);
    }
}

