<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Promo extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'price'
    ];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'promo_items', 'promo_id', 'product_id');
    }


}
