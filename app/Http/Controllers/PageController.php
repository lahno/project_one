<?php

namespace App\Http\Controllers;

use App\Page;
use Illuminate\Http\Request;
use Route;

class PageController extends SiteController
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
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($alias)
    {
        $page = Page::select('*')->where('alias', $alias)->first();

        $content = view(env('THEME').'.page')
            ->with('page', $page)
            ->render();
        $this->vars = array_add($this->vars, 'content', $content);

        $this->title = ((!empty($page->seo_title))?$page->seo_title.' | ':'').'Web-icon.com.ua - сайт для Вашего бизнеса';
        $this->title_en = ((!empty($page->seo_title))?$page->seo_title.' | ':'').env('TITLE_SITE_EN');
        $this->description = strip_tags($page->seo_description);
        $this->description_en = strip_tags($page->seo_description);
        return $this->renderOutput();
    }
}
