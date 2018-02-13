<?php

use Illuminate\Database\Seeder;

class OrdersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('orders')->insert([
            [
                'name' => 'order_1',
                'email' => 'email_1@site.com',
                'phone' => '0930000001',
                'service_id' => 1,
                'status_id' => 1
            ],
            [
                'name' => 'order_2',
                'email' => 'email_2@site.com',
                'phone' => '0930000002',
                'service_id' => 2,
                'status_id' => 2
            ],
            [
                'name' => 'order_3',
                'email' => 'email_3@site.com',
                'phone' => '0930000001',
                'service_id' => 4,
                'status_id' => 3
            ]

        ]);
    }
}
