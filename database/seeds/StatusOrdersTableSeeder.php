<?php

use Illuminate\Database\Seeder;

class StatusOrdersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('status_orders')->insert([
            [
                'name' => 'status_1',
                'name_en' => 'status_1'
            ],
            [
                'name' => 'status_2',
                'name_en' => 'status_2'
            ],
            [
                'name' => 'status_3',
                'name_en' => 'status_3'
            ]

        ]);
    }
}
