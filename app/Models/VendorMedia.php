<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VendorMedia extends Model
{
	protected $table = 'vendor_media';
  protected $fillable = ['media_type','vendor_id','path'];

    public function getPathAttribute($value)
    {
      $values = array();
      $img = 'default/default_image.png';
      if(!empty($value) && !is_array($value)){
        $img = $value;
      }
      $img = str_replace(' ', '', $img);
      
      try {
        $ex = checkImageExtension($img);
        $original = \Storage::disk('s3')->url($img);
        
        // In local environment, use direct S3 URL without proxy
        if (app()->environment('local')) {
            return [
                'proxy_url' => '',
                'image_path' => $original,
                'image_fit' => '',
                'original_image' => $original,
            ];
        }
        
        // Production: use proxy
        $values['proxy_url'] = \Config::get('app.IMG_URL1');
        if (substr($img, 0, 7) == "http://" || substr($img, 0, 8) == "https://"){
          $values['image_path'] = \Config::get('app.IMG_URL2').'/'.$img;
        } else {
          $values['image_path'] = \Config::get('app.IMG_URL2').'/'.$original.$ex;
        }
        $values['image_fit'] = \Config::get('app.FIT_URl');
        $values['original_image'] = $original;
        return $values;
      } catch (\Throwable $th) {
        // Fallback to default image if S3 fails
        $fallback = asset('assets/images/default_image.png');
        return [
            'proxy_url' => '',
            'image_path' => $fallback,
            'image_fit' => '',
            'original_image' => $fallback,
        ];
      }
    }
    
}
