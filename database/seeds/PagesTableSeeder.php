<?php

use Illuminate\Database\Seeder;

class PagesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('pages')->insert([
            [
                'name' => 'О нас',
                'name_en' => 'About',
                'alias' => 'about'
            ],
            [
                'name' => 'Тестовая страница',
                'name_en' => 'Test page',
                'alias' => 'test_page'
            ]
        ]);
    }
}
