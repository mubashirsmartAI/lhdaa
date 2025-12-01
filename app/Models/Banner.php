<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    protected $fillable = ['name', 'link', 'image', 'image_mobile', 'validity_on', 'sorting', 'status', 'start_date_time', 'end_date_time', 'redirect_category_id', 'redirect_vendor_id', 'link_url' ];

    public function getImageAttribute($value)
    {
        return $this->formatImageResponse($value);
    }

    public function getImageMobileAttribute($value)
    {
        return $this->formatImageResponse($value);
    }

    public function category(){
      return $this->hasOne('App\Models\Category', 'id', 'redirect_category_id');
    }
    public function vendor(){
      return $this->hasOne('App\Models\Vendor', 'id', 'redirect_vendor_id');
    }

    public function geos(){
      return $this->hasMany('App\Models\BannerServiceArea', 'banner_id', 'id');
    }

    public function syncGeos(){
      return $this->belongsToMany('App\Models\BannerServiceArea', 'banner_service_areas', 'banner_id', 'service_area_id')->withTimestamps();
    }

    /**
     * Build a consistent response for banner images stored on S3,
     * and gracefully fallback to a local asset when unavailable.
     */
    private function formatImageResponse($value)
    {
        $img = !empty($value) ? $value : 'default/default_image.png';

        try {
            $original = \Storage::disk('s3')->url($img);
            $ex = checkImageExtension($img);

            return [
                'proxy_url' => \Config::get('app.IMG_URL1'),
                'image_path' => \Config::get('app.IMG_URL2').'/'.$original.$ex,
                'image_fit' => \Config::get('app.FIT_URl'),
                'original' => $original,
            ];
        } catch (\Throwable $th) {
            $fallback = asset('assets/images/default_image.png');
            return [
                'proxy_url' => '',
                'image_path' => $fallback,
                'image_fit' => '',
                'original' => $fallback,
            ];
        }
    }
}