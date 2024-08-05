<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'parent_id',
        'category_id',
        'promo_id',
        'name',
        'price'
    ];

    public function category() {
        return $this->belongsTo(Category::class);
    }
}
