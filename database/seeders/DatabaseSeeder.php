<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Category;
use App\Models\Product;
use App\Models\Promo;
use App\Models\PromoItem;
use App\Models\Counter;
use App\Models\Printer;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        // User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        $counters = ['Printer Kasir', 'Printer Dapur', 'Printer Bar'];
        foreach ($counters as $counter) {
            Printer::create(['name' => $counter]);
        }

        $counters = ['Meja No 1', 'Meja No 2', 'Meja No 3'];
        foreach ($counters as $counter) {
            Counter::create(['name' => $counter]);
        }

        $categories = ['Makanan', 'Minuman', 'Promo'];
        foreach ($categories as $category) {
            category::insert([
                'name' => $category
            ]);
        }

        $products = [
            [
                'name' => 'Jeruk',
                'category' => 'Minuman',
                'price' => NULL,
                'sub_item' => [
                    [
                        'name' => 'Jeruk Dingin',
                        'price' => 12000
                    ],
                    [
                        'name' => 'Jeruk Panas',
                        'price' => 10000
                    ]
                ]
            ],
            [
                'name' => 'Teh',
                'category' => 'Minuman',
                'price' => NULL,
                'sub_item' => [
                    [
                        'name' => 'Teh Manis',
                        'price' => 8000
                    ],
                    [
                        'name' => 'Teh Tawar',
                        'price' => 5000
                    ]
                ]
            ],
            [
                'name' => 'Kopi',
                'category' => 'Minuman',
                'price' => NULL,
                'sub_item' => [
                    [
                        'name' => 'Kopi Dingin',
                        'price' => 8000
                    ],
                    [
                        'name' => 'Kopi Panas',
                        'price' => 6000
                    ]
                ]
            ],
            [
                'name' => 'Extra Es Batu',
                'category' => 'Minuman',
                'price' => 2000,
                'sub_item' => []
            ],
            [
                'name' => 'Mie',
                'category' => 'Makanan',
                'price' => NULL,
                'sub_item' => [
                    [
                        'name' => 'Mie Goreng',
                        'price' => 15000
                    ],
                    [
                        'name' => 'Mie Kuah',
                        'price' => 15000
                    ]
                ]
            ],
            [
                'name' => 'Nasi Goreng',
                'category' => 'Makanan',
                'price' => 15000,
                'sub_item' => []
            ],
            [
                'name' => 'Nasi Goreng + Jeruk Dingin',
                'category' => 'Promo',
                'price' => 23000,
                'sub_item' => [],
                'promo' => [
                    'promo_item' => [
                        'Nasi Goreng', 'Jeruk Dingin'
                    ]
                ]
            ],
        ];

        foreach ($products as $product) {
            $promo_id = NULL;
            if (isset($product['promo'])) {
                $promo = Promo::create([
                    'name' => $product['name'],
                    'price' => $product['price']
                ]);
                $promo_id = $promo->id;
                foreach ($product['promo']['promo_item'] as $item) {
                    $item = Product::where('name', $item)->first();
                    PromoItem::create([
                        'promo_id' => $promo->id,
                        'product_id' => $item->id
                    ]);
                }
            }
            $parentProduct = Product::create([
                'name' => $product['name'],
                'category_id' => Category::where('name', $product['category'])->first()->id,
                'price' => $product['price'],
                'promo_id' => $promo_id
            ]);
            if ($product['sub_item']) {
                foreach ($product['sub_item'] as $subitem) {
                    Product::create([
                        'parent_id' => $parentProduct->id,
                        'category_id' => $parentProduct->category_id,
                        'name' => $subitem['name'],
                        'price' => $subitem['price']
                    ]);
                }
            }
        }
    }
}
