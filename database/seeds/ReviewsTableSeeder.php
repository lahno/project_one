<?php

use Illuminate\Database\Seeder;

class ReviewsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('reviews')->insert([
            [
                'name' => 'Иванов Иван Иванович',
                'type_case' => 'Интернет магазин',
                'avatar' => 'img/avatars/no_avatar.jpg',
                'desc' => 'Текст отзыва выводится тут'
            ],
            [
                'name' => 'Сидоров Анатолий',
                'type_case' => 'Landing Page',
                'avatar' => 'img/avatars/no_avatar.jpg',
                'desc' => 'Текст отзыва выводится тут'
            ],
            [
                'name' => 'Сидоренко Валентина Степановна',
                'type_case' => 'Социальная сеть',
                'avatar' => 'img/avatars/no_avatar.jpg',
                'desc' => 'Текст отзыва выводится тут'
            ],
            [
                'name' => 'Гречко Николай Николаевич',
                'type_case' => 'Портал',
                'avatar' => 'img/avatars/no_avatar.jpg',
                'desc' => 'Текст отзыва выводится тут'
            ]
        ]);
    }
}
