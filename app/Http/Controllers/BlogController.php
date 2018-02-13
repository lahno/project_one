<?php

namespace App\Http\Controllers;

use App\Article;
use App\Category_article;

use App\Events\PostHasViewed;
use LaravelLocalization;
use Jenssegers\Date\Date;

class BlogController extends SiteController
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
    public function index($category = null)
    {
        $cat = false;
        if ($category){
            $cat = Category_article::where('alias', $category)->first();
            $articles = Article::select('name', 'alias', 'short_desc', 'img', 'views', 'status', 'category_id', 'created_at')
                ->where('status', 'yes')
                ->where('category_id', $cat->id)
                ->orderBy('created_at', 'DESC')
                ->get();
            $featuredArticles = Article::select('name', 'alias', 'short_desc', 'img', 'views', 'status', 'category_id', 'created_at')
                ->where('status', 'yes')
                ->where('category_id', $cat->id)
                ->orderBy('views', 'desc')
                ->take(3)
                ->get();
        }else{
            $articles = Article::select('name', 'alias', 'short_desc', 'img', 'views', 'status', 'category_id', 'created_at')
                ->where('status', 'yes')
                ->orderBy('created_at', 'DESC')
                ->get();
            $featuredArticles = Article::select('name', 'alias', 'short_desc', 'img', 'views', 'status', 'category_id', 'created_at')
                ->where('status', 'yes')
                ->orderBy('views', 'desc')
                ->take(3)
                ->get();
        }

        if ($articles){
            $articles->load('cat');
        }
        if ($featuredArticles){
            $featuredArticles->load('cat');
        }

        $commArray = $this->getDisqusCount();

        $content = view(env('THEME').'.articles')
            ->with('articles', $articles)
            ->with('fArticles', $featuredArticles)
            ->with('cat', $cat)
            ->with('commArray', $commArray)
            ->render();

        $this->vars = array_add($this->vars, 'content', $content);

        $this->title = 'Блог'.' | Web-icon.com.ua - сайт для Вашего бизнеса';
        $this->title_en = 'Blog'.' | '.env('TITLE_SITE_EN');
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
    public function show($category = null, $alias)
    {
        Date::setLocale(LaravelLocalization::getCurrentLocale());
        $data = Date::now()->format('F Y');

        $article = Article::where('alias', $alias)->where('status', 'yes')->first();
        if ($article){
            $article->load('cat');

            $similarArticles = $this->getSimilar($article->tags, $article->alias, $article->category_id);

            if ($similarArticles){
                $similarArticles->load('cat');
            }

            $commArray = $this->getDisqusCount();

            $content = view(env('THEME').'.article')
                ->with('article', $article)
                ->with('data', $data)
                ->with('similarArticles', $similarArticles)
                ->with('commArray', $commArray)
                ->render();

            $this->vars = array_add($this->vars, 'content', $content);

            $this->title = ((!empty($article->seo_title))?$article->seo_title.' | ':'').'Web-icon.com.ua - сайт для Вашего бизнеса';
            $this->title_en = ((!empty($article->seo_title))?$article->seo_title.' | ':'').env('TITLE_SITE_EN');
            $this->description = strip_tags($article->seo_description);
            $this->description_en = strip_tags($article->seo_description);
            $this->title_img = $article->img;
            event(new PostHasViewed($article));
            return $this->renderOutput();
        }else{
            return response()->view(env('THEME').'.errors.404', [], 404);
        }
    }

    public function showTag($tag){
        $cat = -1;
        $articles = Article::select('name', 'alias', 'short_desc', 'img', 'views', 'status', 'category_id', 'created_at')
            ->where('status', 'yes')
            ->where('tags->tag_1', $tag)
            ->orWhere('tags->tag_2', $tag)
            ->orWhere('tags->tag_3', $tag)
            ->get();

        if ($articles){
            $articles->load('cat');
        }
        $featuredArticles = Article::orderBy('views', 'desc', 'status')
            ->where('status', 'yes')
            ->take(3)
            ->get();
        if ($featuredArticles){
            $featuredArticles->load('cat');
        }

        $commArray = $this->getDisqusCount();

        $content = view(env('THEME').'.articles')
            ->with('articles', $articles)
            ->with('fArticles', $featuredArticles)
            ->with('cat', $cat)
            ->with('commArray', $commArray)
            ->render();

        $this->vars = array_add($this->vars, 'content', $content);

        $this->title = 'Блог'.' | Web-icon.com.ua - сайт для Вашего бизнеса';
        $this->title_en = 'Blog'.' | '.env('TITLE_SITE_EN');
        $this->description = 'Разработка сайтов любой сложности, уникальный дизайн, seo-продвижение.';
        $this->description_en = 'Development of sites of any complexity, unique design, seo-promotion.';
        return $this->renderOutput();
    }

    protected function getSimilar($tags, $alias, $category){

        $tags = json_decode($tags);
        if (array_key_exists('t3', $tags )){
            $similar =  Article::select('name', 'alias', 'short_desc', 'img', 'views', 'status', 'category_id', 'created_at')
                ->where('status', 'yes')
                ->where([
                    ['alias', '<>', $alias],
                    ['tags->tag_1', $tags->t1],
                ])
                ->orWhere([
                    ['alias', '<>', $alias],
                    ['tags->tag_2', $tags->t2],
                ])
                ->orWhere([
                    ['alias', '<>', $alias],
                    ['tags->tag_3', $tags->t3],
                ])
                ->take(3)->get();
        }elseif(array_key_exists('t2', $tags )){
            $similar =  Article::select('name', 'alias', 'short_desc', 'img', 'views', 'status', 'category_id', 'created_at')
                ->where('status', 'yes')
                ->where([
                    ['alias', '<>', $alias],
                    ['tags->tag_1', $tags->t1],
                ])
                ->orWhere([
                    ['alias', '<>', $alias],
                    ['tags->tag_2', $tags->t2],
                ])
                ->orWhere([
                    ['alias', '<>', $alias],
                    ['tags->tag_1', $tags->t2],
                ])
                ->orWhere([
                    ['alias', '<>', $alias],
                    ['tags->tag_2', $tags->t1],
                ])
                ->take(3)->get();
        }elseif(array_key_exists('t1', $tags )){
            $similar =  Article::select('name', 'alias', 'short_desc', 'img', 'views', 'status', 'category_id', 'created_at')
                ->where('status', 'yes')
                ->where([
                    ['alias', '<>', $alias],
                    ['tags->tag_1', $tags->t1],
                ])
                ->take(3)->get();
        }else{
            $similar =  Article::select('name', 'alias', 'short_desc', 'img', 'views', 'status', 'category_id', 'created_at')
                ->where('status', 'yes')
                ->where([
                    ['alias', '<>', $alias],
                    ['category_id', $category],
                ])
                ->take(3)->get();
        }

        return $similar;
    }

    protected function getDisqusCount() {
        $json = json_decode(file_get_contents("https://disqus.com/api/3.0/forums/listThreads.json?forum=".env('DISQUS_NAME')."&api_key=".env('DISQUS_PUBLIC_KEY')),true);
        $array = $json['response'];
        return $array;
    }
}
