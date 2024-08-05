<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use OpenApi\Attributes as OA;
use App\Models\Product;
use App\Models\Category;
use App\Models\Promo;
use App\Models\PromoItem;

class ProductController extends Controller
{
    #[OA\Get(
        path: '/product',
        summary: 'Get all products',
        description: 'Menampilkan semua list product',
        tags: ['Product'],
        responses: [
            new OA\Response(
                response: 200,
                description: 'Successful response',
                content: new OA\JsonContent(
                    properties: [
                        new OA\Property(
                            property: 'data',
                            type: 'array',
                            description: 'List of products',
                            items: new OA\Items(
                                properties: [
                                    new OA\Property(property: 'id', type: 'integer', description: 'Product ID yang bisa digunakan sebagai parameter untuk membuat order', example: 1),
                                    new OA\Property(property: 'category', type: 'string', description: 'Product category', example: 'Beverage'),
                                    new OA\Property(property: 'name', type: 'string', description: 'Nama product', example: 'Cappuccino'),
                                    new OA\Property(property: 'price', type: 'number', description: 'Harga per product', example: 50000),
                                ],
                                type: 'object'
                            )
                        )
                    ],
                    type: 'object'
                )
            ),
            new OA\Response(
                response: 401,
                description: 'Unauthorized'
            ),
        ]
    )]
    public function index() {
        $products = Product::whereNotNull('price')->with('category')->get();
        $data = [];
        foreach ($products as $product) {
            array_push($data, [
                'id' => $product->id,
                'name' => $product->name,
                'category' => $product->category->name,
                'price' => $product->price
            ]);
        }
        return response()->json(['data' => $data]);
    }


}
