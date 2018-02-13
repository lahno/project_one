<?php

use Illuminate\Database\Seeder;

class CategoryArticlesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('category_articles')->insert([
            [
                'name' => 'Дизайн',
                'name_en' => 'Design',
                'alias' => 'design'
            ],
            [
                'name' => 'Программирование',
                'name_en' => 'Programming',
                'alias' => 'programming'
            ],
            [
                'name' => 'Маркетинг',
                'name_en' => 'Marketing',
                'alias' => 'marketing'
            ]
        ]);
    }
}
