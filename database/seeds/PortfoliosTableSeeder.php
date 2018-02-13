<?php

use Illuminate\Database\Seeder;

class PortfoliosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('portfolios')->insert([
            [
                'name' => 'Portfolio 1',
                'name_en' => 'Portfolio 1',
                'alias' => 'portfolio_1',
                'short_desc' => 'Short description text',
                'short_desc_en' => 'Short description text',
                'desc' => 'Description text',
                'desc_en' => 'Description text',
                'img' => 'no_img.jpg',
                'link' => 'test.com',
                'iframe_link' => 'google.com',
                'category_id' => 1
            ],
            [
                'name' => 'Portfolio 2',
                'name_en' => 'Portfolio 2',
                'alias' => 'portfolio_2',
                'short_desc' => 'Short description text',
                'short_desc_en' => 'Short description text',
                'desc' => 'Description text',
                'desc_en' => 'Description text',
                'img' => 'no_img.jpg',
                'link' => 'test.com',
                'iframe_link' => 'google.com',
                'category_id' => 2
            ],
            [
                'name' => 'Portfolio 3',
                'name_en' => 'Portfolio 3',
                'alias' => 'portfolio_3',
                'short_desc' => 'Short description text',
                'short_desc_en' => 'Short description text',
                'desc' => 'Description text',
                'desc_en' => 'Description text',
                'img' => 'no_img.jpg',
                'link' => '',
                'iframe_link' => 'google.com',
                'category_id' => 3
            ],

        ]);
    }
}
