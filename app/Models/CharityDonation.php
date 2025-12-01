<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CharityDonation extends Model
{
    use HasFactory;

    protected $fillable = ['charity_id', 'amount'];

    public function charity()
    {
        return $this->belongsTo(Charity::class);
    }
}
