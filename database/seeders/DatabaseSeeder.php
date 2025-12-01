<?php
namespace Database\Seeders;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run(){
         Schema::disableForeignKeyConstraints();
         DB::statement('SET FOREIGN_KEY_CHECKS=0;');
         $this->call([
              AppStylingSeeder::class,
              BannerDataSeeder::class,
              CommonDataSeeder::class,
              CountryTableSeeder::class,
              CurrencyTableSeeder::class,
              DispatcherStatusOptionSeeder::class,
              EmailTemplateSeeder::class,
              HomePageLabelSeeder::class,
              HomePageLabelSeederDefault::class,
              MapProviderSeeder::class,
              LanguageTableSeeder::class,
              ClientLanguageSeeder::class,
              LuxuryOptionsSeeder::class,
              NomenclatureTableSeeder::class,
              NotificationSeeder::class,
              NotificationTemplateSeeder::class,
              OrderStatusSeeder::class,
              OrderStatusSeeder::class,
              PaymentMethodSeeder::class,
              PaymentOptionSeeder::class,
              PayoutOptionSeeder::class,
              PermissionSeeder::class,
              PromoTypeSeeder::class,
              ReturnReasonSeeder::class,
              RoleSeeder::class,
              SmsProviderSeeder::class,
              SmsTemplateSeeder::class,
              SubscriptionFeaturesListUserSeeder::class,
              SubscriptionFeaturesListVendorSeeder::class,
              SubscriptionStatusOptionsSeeder::class,
              TemplateSeeder::class,
              TimezoneSeeder::class,
             TypeSeeder::class,
             CategorySeeder::class,
             BrandSeeder::class,
             VendorSeeder::class,
             VariantSeeder::class,
             ProductSeeder::class,
              VendorProductTempleteSeeder::class,
              WebStylingSeeder::class,
              WebStylingOptionSeeder::class,
              ExchangeReasonSeeder::class,
              PanelAuthUserSeeder::class,
              AdminUserSeeder::class,
              AppStylingAddOptionTableSeeder::class,
              MainRoleSeeder::class,
              MainPermissionSeeder::class,
              ShippingOptionSeeder::class
          ]);
         DB::statement('SET FOREIGN_KEY_CHECKS=1;');
         Schema::enableForeignKeyConstraints();
        // $this->call(UsersTableSeeder::class);
       // $this->call(AppStylingOptionsTableSeeder::class);
    }
}