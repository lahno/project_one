<?php

namespace App\Http\Controllers;

use App\Service;
use Illuminate\Http\Request;

class ServiceController extends SiteController
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

        $services = view(env('THEME').'.services')
            ->with('services', $services)
            ->render();

        $this->vars = array_add($this->vars, 'content', $services);

        $this->title = 'Услуги'.' | '.env('TITLE_SITE');
        $this->title_en = 'Services'.' | '.env('TITLE_SITE_EN');
        $this->description = 'Разработка сайтов любой сложности, уникальный дизайн, seo-продвижение.';
        $this->description_en = 'Development of sites of any complexity, unique design, seo-promotion.';
        return $this->renderOutput();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($alias)
    {
        $service = Service::where('alias', $alias)->first();

        $content = view(env('THEME').'.service')
            ->with('service', $service)
            ->render();

        $this->vars = array_add($this->vars, 'content', $content);
        $this->title = ((!empty($service->seo_title))?$service->seo_title.' | ':'').env('TITLE_SITE');
        $this->title_en = ((!empty($service->seo_title))?$service->seo_title.' | ':'').env('TITLE_SITE_EN');
        $this->description = strip_tags($service->seo_description);
        $this->description_en = strip_tags($service->seo_description);
        return $this->renderOutput();
    }
}
