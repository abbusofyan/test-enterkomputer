<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use OpenApi\Attributes as OA;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Promo;
use App\Models\PromoItem;
use Carbon\Carbon;

class OrderController extends Controller
{
    #[OA\Get(
        path: '/order/get-bill/{order_id}',
        summary: 'Get bill order',
        description: 'Menampilkan detail tagihan pesanan berdasarkan order id',
        tags: ['Order'],
        parameters: [
            new OA\Parameter(
                name: 'order_id',
                in: 'path',
                required: true,
                description: 'Order ID',
                schema: new OA\Schema(
                    type: 'string',
                    example: '1'
                )
            )
        ],
        responses: [
            new OA\Response(
                response: 200,
                description: 'Successful response',
                content: new OA\JsonContent(
                    properties: [
                        new OA\Property(property: 'counter', type: 'string', description: 'Counter name'),
                        new OA\Property(property: 'customer_name', type: 'string', description: 'Customer name'),
                        new OA\Property(
                            property: 'pesanan',
                            type: 'array',
                            description: 'List of ordered products',
                            items: new OA\Items(
                                type: 'object',
                                properties: [
                                    new OA\Property(property: 'product', type: 'string', description: 'Product name'),
                                    new OA\Property(property: 'qty', type: 'integer', description: 'Quantity ordered'),
                                    new OA\Property(property: 'sub_total', type: 'number', description: 'Subtotal price'),
                                ]
                            )
                        ),
                        new OA\Property(property: 'total', type: 'number', description: 'Total price'),
                        new OA\Property(property: 'tanggal_pembelian', type: 'string', format: 'date-time', description: 'Purchase date and time'),
                    ],
                    type: 'object'
                )
            ),
            new OA\Response(
                response: 401,
                description: 'Unauthorized'
            ),
            new OA\Response(
                response: 404,
                description: 'Order not found',
                content: new OA\JsonContent(
                    properties: [
                        new OA\Property(property: 'status', type: 'string', example: 'Failed', description: 'Status of the response'),
                        new OA\Property(property: 'message', type: 'string', example: 'Data pesanan tidak ditemukan', description: 'Error message'),
                    ],
                    type: 'object'
                )
            )
        ]
    )]
    public function get($order_id) {
        $order = Order::find($order_id);
        if (!$order) {
            return response()->json([
                'status' => 'Failed',
                'message' => 'Data pesanan tidak ditemukan'
            ], 404);
        }

        $order->load('products', 'counter');
        $order_items = [];

        foreach ($order->products as $product) {
            $order_item = OrderItem::where('order_id', $order->id)
                                    ->where('product_id', $product->id)
                                    ->first();
            array_push($order_items, [
                'product' => $product->name,
                'qty' => $order_item->qty,
                'sub_total' => $order_item->total_price
            ]);
        }

        return response()->json([
            'counter' => $order->counter->name,
            'customer_name' => $order->customer_name,
            'pesanan' => $order_items,
            'total' => $order->total_price,
            'tanggal_pembelian' => Carbon::parse($order->created_at)
                                          ->locale('id')
                                          ->translatedFormat('j F Y H:i')
        ]);
    }

    #[OA\Post(
        path: '/order/create',
        summary: 'Create new order',
        description: 'Endpoint untuk membuat order baru. untuk mendapatkan product id anda bisa menggunakan endpoint /product',
        tags: ['Order'],
        requestBody: new OA\RequestBody(
            required: true,
            content: new OA\JsonContent(
                properties: [
                    new OA\Property(
                        property: 'counter_id',
                        type: 'number',
                        description: 'Id meja yang melayani customer',
                        example: 1
                    ),
                    new OA\Property(
                        property: 'customer_name',
                        type: 'string',
                        description: 'Nama customer',
                        example: 'Budi'
                    ),
                    new OA\Property(
                        property: 'items',
                        type: 'array',
                        description: 'Product yang dipesan',
                        items: new OA\Items(
                            properties: [
                                new OA\Property(
                                    property: 'product_id',
                                    type: 'number',
                                    description: 'Id product',
                                    example: 15
                                ),
                                new OA\Property(
                                    property: 'qty',
                                    type: 'number',
                                    description: 'Jumlah product yang dipesan',
                                    example: 2
                                )
                            ],
                            type: 'object'
                        )
                    )
                ],
                type: 'object'
            )
        ),
        responses: [
            new OA\Response(
                response: 200,
                description: 'Successful response',
                content: new OA\JsonContent(
                    properties: [
                        new OA\Property(property: 'success', type: 'boolean', description: 'Status pembuatan order', example: true),
                        new OA\Property(property: 'message', type: 'string', description: 'Transaction status message', example: 'Pesanan diproses'),
                        new OA\Property(
                            property: 'order',
                            type: 'object',
                            description: 'Details of the created order',
                            properties: [
                                new OA\Property(property: 'order_id', type: 'integer', description: 'Order ID', example: 1),
                                new OA\Property(property: 'total_price', type: 'number', description: 'Total price of the order', example: 50000),
                            ]
                        ),
                        new OA\Property(
                            property: 'items',
                            type: 'array',
                            description: 'Details of ordered items',
                            items: new OA\Items(
                                properties: [
                                    new OA\Property(property: 'product_id', type: 'integer', description: 'Product ID', example: 15),
                                    new OA\Property(property: 'qty', type: 'integer', description: 'Quantity ordered', example: 2),
                                    new OA\Property(property: 'total_price', type: 'number', description: 'Total price of this item', example: 10000),
                                ],
                                type: 'object'
                            )
                        ),
                    ],
                )
            ),
            new OA\Response(
                response: 401,
                description: 'Unauthorized'
            ),
            new OA\Response(
                response: 400,
                description: 'Bad Request',
                content: new OA\JsonContent(
                    properties: [
                        new OA\Property(property: 'success', type: 'boolean', example: false),
                        new OA\Property(property: 'message', type: 'string', example: 'Invalid input data'),
                    ],
                    type: 'object'
                )
            ),
        ]
    )]
    public function create(Request $request) {
        $data = $request->all();
        $total_price = $this->countTotalPrice($data['items']);
        $order = Order::create([
            'counter_id' => $request->counter_id,
            'customer_name' => $request->customer_name,
            'total_price' => $total_price
        ]);

        if ($order) {
            foreach ($request->items as $item) {
                $product = Product::findOrFail($item['product_id']);
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item['product_id'],
                    'qty' => $item['qty'],
                    'total_price' => $product->price * $item['qty']
                ]);
            }
        }

        $printData = $this->printData($request->items);
        return response()->json([
            'success' => true,
            'message' => 'Pesanan diproses',
            'order' => [
                'order_id' => $order->id,
                'total_price' => $order->total_price,
            ],
            'items' => $printData,
        ]);
    }

    public function printData($orderItems) {
        $item_makanan = [];
        $item_minuman = [];
        $item_kasir = [];
        $total_harga = 0;

        foreach ($orderItems as $orderItem) {
            $product = Product::with('category')->findOrFail($orderItem['product_id']);
            $subTotal = $product->price * $orderItem['qty'];

            array_push($item_kasir, [
                'product' => $product->name,
                'qty' => $orderItem['qty'],
                'sub_total' => $subTotal
            ]);

            $total_harga += $subTotal;

            if ($product->promo_id) {
                $promoItems = Promo::with('products.category')->findOrFail($product->promo_id);
                foreach ($promoItems->products as $product) {
                    $order_item = [
                        'product' => $product->name,
                        'qty' => $orderItem['qty']
                    ];
                    if ($product->category->name == 'Makanan') {
                        array_push($item_makanan, $order_item);
                    }

                    if ($product->category->name == 'Minuman') {
                        array_push($item_minuman, $order_item);
                    }
                }
            } else {
                $order_item = [
                    'product' => $product->name,
                    'qty' => $orderItem['qty']
                ];
                if ($product->category->name == 'Makanan') {
                    array_push($item_makanan, $order_item);
                }

                if ($product->category->name == 'Minuman') {
                    array_push($item_minuman, $order_item);
                }
            }
        }
        return [
            'Printer kasir' => [
                'data' => $item_kasir,
                'total' => $total_harga
            ],
            'Printer Dapur' => [
                'data' => $item_makanan
            ],
            'Printer Bar' => [
                'data' => $item_minuman
            ]
        ];
    }

    public function countTotalPrice($data) {
        $total_price = 0;
        foreach ($data as $orderItem) {
            $product = Product::findOrFail($orderItem['product_id']);
            $total_price += $product->price * $orderItem['qty'];
        }
        return $total_price;
    }
}
