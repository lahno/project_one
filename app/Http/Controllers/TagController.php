<?php

namespace App\Http\Controllers;

use App\Article;

use Illuminate\Http\Request;

class TagController extends SiteController
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
    public function index($tag)
    {
        $cat = -1;

        $articles = Article::where('tags->t1', $tag)
            ->orWhere('tags->t2', $tag)
            ->orWhere('tags->t3', $tag)
            ->get();

        if ($articles){
            $articles->load('cat');
        }
        $featuredArticles = Article::orderBy('views', 'desc')
            ->take(3)
            ->get();
        if ($featuredArticles){
            $featuredArticles->load('cat');
        }

        $content = view(env('THEME').'.articles')
            ->with('cat', $cat)
            ->with('articles', $articles)
            ->with('fArticles', $featuredArticles)
            ->render();

        $this->vars = array_add($this->vars, 'content', $content);

        $this->title = 'Блог'.' | Web-icon.com.ua - сайт для Вашего бизнеса';
        $this->title_en = 'Blog'.' | '.env('TITLE_SITE_EN');
        $this->description = 'Разработка сайтов любой сложности, уникальный дизайн, seo-продвижение.';
        $this->description_en = 'Разработка сайтов любой сложности, уникальный дизайн, seo-продвижение.';
        return $this->renderOutput();
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
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
