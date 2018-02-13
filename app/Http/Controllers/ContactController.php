<?php

namespace App\Http\Controllers;

use App\Service;
use Illuminate\Http\Request;

class ContactController extends SiteController
{
    public function __construct()
    {
        $this->template = env('THEME').'.index_content';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $services = Service::all();

        $content = view(env('THEME').'.contact')
            ->with('services', $services)
            ->render();

        $this->vars = array_add($this->vars, 'content', $content);

        $this->title = 'Контакты'.' | Web-icon.com.ua - сайт для Вашего бизнеса';
        $this->title_en = 'Contacts'.' | '.env('TITLE_SITE_EN');
        $this->description = 'Разработка сайтов любой сложности, уникальный дизайн, seo-продвижение.';
        $this->description_en = 'Development of sites of any complexity, unique design, seo-promotion.';
        return $this->renderOutput();
    }
}
