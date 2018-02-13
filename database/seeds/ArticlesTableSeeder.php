<?php

use Illuminate\Database\Seeder;

class ArticlesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('articles')->insert([
            [
                'name' => 'Article 1',
                //'name_en' => 'Article 1',
                'alias' => 'article_1',
                'short_desc' => 'Short description text',
                //'short_desc_en' => 'Short description text',
                'desc' => 'Description text',
                //'desc_en' => 'Description text',
                'img' => 'img/uploads/articles/no_img.jpg',
                'tags' => json_encode(['tag_1'=>'design', 'tag_2'=>'web', 'tag_3'=>'programming']),
                'category_id' => 1
            ],
            [
                'name' => 'Article 2',
                //'name_en' => 'Article 2',
                'alias' => 'article_2',
                'short_desc' => 'Short description text',
                //'short_desc_en' => 'Short description text',
                'desc' => 'Description text',
                //'desc_en' => 'Description text',
                'img' => 'img/uploads/articles/no_img.jpg',
                'tags' => json_encode(['tag_1'=>'design', 'tag_2'=>'web']),
                'category_id' => 2
            ],
            [
                'name' => 'Article 3',
                //'name_en' => 'Article 3',
                'alias' => 'article_3',
                'short_desc' => 'Short description text',
                //'short_desc_en' => 'Short description text',
                'desc' => 'Description text',
                //'desc_en' => 'Description text',
                'img' => 'img/uploads/articles/no_img.jpg',
                'tags' => json_encode(['tag_1'=>'design']),
                'category_id' => 2
            ],
            [
                'name' => 'Article 4',
                //'name_en' => 'Article 4',
                'alias' => 'article_4',
                'short_desc' => 'Short description text',
                //'short_desc_en' => 'Short description text',
                'desc' => 'Description text',
                //'desc_en' => 'Description text',
                'img' => 'img/uploads/articles/no_img.jpg',
                'tags' => json_encode(['tag_2'=>'web']),
                'category_id' => 3
            ]
        ]);
    }
}
