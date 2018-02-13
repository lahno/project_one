<?php

use Illuminate\Database\Seeder;

class ClientOrdersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('client_orders')->insert([
            [
                'client_id' => 1,
                'order_id' => 1
            ],
            [
                'client_id' => 1,
                'order_id' => 2
            ],
            [
                'client_id' => 2,
                'order_id' => 3
            ]

        ]);
    }
}
