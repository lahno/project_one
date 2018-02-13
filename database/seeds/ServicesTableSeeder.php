<?php

use Illuminate\Database\Seeder;

class ServicesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('services')->insert([
            [
                'name' => 'Разработка сайта',
                'name_en' => 'Site development',
                'alias' => 'site_development',
                'service_list' => json_encode([
                    'Разработка прототипа',
                    'Индивидуальный дизайн',
                    'Кроссбраузерность',
                    'Система статистики',
                    'Система управления',
                    'SEO — оптимизация',
                    'Постоянное сопровождение'
                ]),
                'service_list_en' => json_encode([
                    'Development of a prototype',
                    'Individual design',
                    'Cross-browser compatibility',
                    'Statistics system',
                    'Control system',
                    'SEO - optimization',
                    'Constant support'
                ]),
                'form_title' => 'Заказать разработку сайта',
                'form_title_en' => 'Order website development',
                'form_pod_title' => 'оставьте заявку и мы свяжемся с Вами',
                'form_pod_title_en' => 'leave a request and we will contact you'
            ],
            [
                'name' => 'Дизайн',
                'name_en' => 'design',
                'alias' => 'design',
                'service_list' => json_encode([
                    'Индивидуальный подход',
                    'Профессиональный дизайн',
                    'Усмотрение всех пожеланий клиента',
                    'Дизайн веб приложений',
                    'Корпоративный стиль',
                    'Типография'
                ]),
                'service_list_en' => json_encode([
                    'Individual approach',
                    'Professional design',
                    'Examination of all the wishes of the client',
                    'Web application design',
                    'Corporate style',
                    'Printing house'
                ]),
                'form_title' => 'Заказать разработку дизайна',
                'form_title_en' => 'Order development of design',
                'form_pod_title' => 'оставьте заявку и мы свяжемся с Вами',
                'form_pod_title_en' => 'leave a request and we will contact you'
            ],
            [
                'name' => 'Маркетинг',
                'name_en' => 'Marketing',
                'alias' => 'marketing',
                'service_list' => json_encode([
                    'Анализ и стратегия продвижения',
                    'Грамотный продающий текст',
                    'Гарантия вывода в ТОП 10',
                    'Оптимизация страниц сайта',
                    'Консультация и рекомендации',
                    'Поддержка проекта'
                ]),
                'service_list_en' => json_encode([
                    'Analysis and promotion strategy',
                    'Literate selling text',
                    'Guarantee of withdrawal in the TOP 10',
                    'Website Optimization',
                    'Consultation and recommendations',
                    'Project support'
                ]),
                'form_title' => 'Заказать маркетинг проекта',
                'form_title_en' => 'Order marketing project',
                'form_pod_title' => 'оставьте заявку и мы свяжемся с Вами',
                'form_pod_title_en' => 'leave a request and we will contact you'
            ],
            [
                'name' => 'Поддержка',
                'name_en' => 'Support',
                'alias' => 'support',
                'service_list' => json_encode([
                    'Контроль стабильности работы',
                    'Тестирование работоспособности',
                    'Устранение технических проблем и ошибок',
                    'Доработки сайта',
                    'Создание резервных копий',
                    'Защита от атак'
                ]),
                'service_list_en' => json_encode([
                    'Control of job stability',
                    'Performance testing',
                    'Elimination of technical problems and errors',
                    'Site development',
                    'Create backups',
                    'Protection against attacks'
                ]),
                'form_title' => 'Заказать поддержку сайта',
                'form_title_en' => 'Order site support',
                'form_pod_title' => 'оставьте заявку и мы свяжемся с Вами',
                'form_pod_title_en' => 'leave a request and we will contact you'
            ]
        ]);
    }
}
