<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ClientCurrency extends Model
{
	protected $fillable = ['client_code', 'currency_id', 'is_primary', 'doller_compare'];

    public function currency()
    {
      return $this->belongsTo('App\Models\Currency','currency_id','id')->select('id', 'name', 'iso_code', 'symbol');
    }


    public static function getAdminCurrencySymbol(){        
      $defaultSymbol = '$';
      $result = ClientCurrency::where('is_primary', 1)->with('currency')->first();
      if(!$result){
        return $defaultSymbol;
      }
      $symbol = optional($result->currency)->symbol;
      return $symbol ?: $defaultSymbol;
    }
}
