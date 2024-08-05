<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PromoItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'promo_id'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
