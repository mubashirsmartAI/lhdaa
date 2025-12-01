<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Traits\HasRoles;

class Charity extends Model
{
    use HasFactory, HasRoles;

    protected $fillable = ['name', 'desc', 'logo', 'address', 'email', 'website', 'phone', 'latitude', 'longitude', 'password', 'accept_donations', 'dial_code'];

    public function user()
    {
        return $this->hasOne(User::class);
    }

    public function beneficiaries()
    {
        return $this->hasMany(Beneficiary::class);
    }

    public function Orders()
    {
        return $this->hasMany('App\Models\Order', 'gift_charity_recipient', 'id'); 
    }

    public function charityDonations()
    {
        return $this->hasMany(CharityDonation::class);
    }
}
