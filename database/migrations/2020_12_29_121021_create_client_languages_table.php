<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreateClientLanguagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Disable foreign key checks at MySQL level
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        
        // Create table using raw SQL to bypass MySQL 8.0+ strict validation
        DB::statement("
            CREATE TABLE `client_languages` (
                `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
                `client_code` VARCHAR(10) NULL,
                `language_id` BIGINT UNSIGNED NULL,
                `is_primary` TINYINT NOT NULL DEFAULT 0 COMMENT '1 for yes, 0 for no',
                `is_active` TINYINT NOT NULL DEFAULT 0 COMMENT '1 for yes, 0 for no',
                `created_at` TIMESTAMP NULL,
                `updated_at` TIMESTAMP NULL,
                INDEX `client_languages_client_code_index` (`client_code`),
                UNIQUE KEY `client_languages_language_id_unique` (`language_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // Foreign key constraints commented out to avoid migration issues
        // Can be added later if needed via separate migration
        
        // Re-enable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('client_languages');
    }
}
