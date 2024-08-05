<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\OrderController;
use App\Http\Controllers\API\ProductController;

Route::group(['prefix' => 'v1'], function () {
    Route::group(['prefix' => 'order'], function () {
        Route::get('/get-bill/{order_id}', [OrderController::class, 'get']);
        Route::post('/create', [OrderController::class, 'create']);
    });

    Route::group(['prefix' => 'product'], function () {
        Route::get('/', [ProductController::class, 'index']);
    });
});
