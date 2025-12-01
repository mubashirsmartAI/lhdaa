<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterProductsTableForEnquireMod extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(){
        Schema::table('products', function (Blueprint $table) {
            if (!Schema::hasColumn('products', 'inquiry_only')) {
                $column = $table->tinyInteger('inquiry_only')->nullable()->default(0);

                // Place the column after an existing column when possible
                if (Schema::hasColumn('products', 'averageRating')) {
                    $column->after('averageRating');
                } elseif (Schema::hasColumn('products', 'is_featured')) {
                    $column->after('is_featured');
                }
            }
        });
        Schema::table('client_preferences', function (Blueprint $table) {
            if (!Schema::hasColumn('client_preferences', 'enquire_mode')) {
            $table->tinyInteger('enquire_mode')->nullable()->after('id')->default(0);
            }
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
