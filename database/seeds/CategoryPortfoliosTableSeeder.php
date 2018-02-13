<?php

use Illuminate\Database\Seeder;

class CategoryPortfoliosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('category_portfolios')->insert([
            [
                'name' => 'Интернет магазин',
                'name_en' => 'Online shop'
            ],
            [
                'name' => 'Landing Page',
                'name_en' => 'Landing Page'
            ],
            [
                'name' => 'Портал',
                'name_en' => 'Portal'
            ]
        ]);
    }
}
