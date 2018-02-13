<?php

namespace App\Http\Controllers;

use App\Order;
use Illuminate\Cookie\CookieJar;
use Illuminate\Http\Request;

class IndexController extends SiteController
{
    public function __construct()
    {
        $this->template = env('THEME').'.index';
    }

    public function index(CookieJar $cookieJar, Request $request)
    {
        $content = true;

        $this->vars = array_add($this->vars, 'content', $content);

        if(!$request->cookie('greeting')){
            $cookieJar->queue(cookie('greeting', true, 45000));
        }

        $this->title = 'Web-icon.com.ua - сайт для Вашего бизнеса';
        $this->title_en = env('TITLE_SITE_EN');
        $this->description = 'Разработка сайтов любой сложности, уникальный дизайн, seo-продвижение.';
        $this->description_en = 'Разработка сайтов любой сложности, уникальный дизайн, seo-продвижение.';
        return $this->renderOutput();
    }
}
