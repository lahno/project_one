<?php

namespace App\Http\Controllers;

use App\Category_portfolio;
use App\Events\PortfolioHasViewed;
use App\Portfolio;
use Illuminate\Http\Request;

class PortfolioController extends SiteController
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
        $portfolios = Portfolio::all();
        if ($portfolios){
            $portfolios->load('cat');
        }
        $category = Category_portfolio::all();

        $content = view(env('THEME').'.portfolios')
            ->with('portfolios', $portfolios)
            ->with('category', $category)
            ->render();

        $this->vars = array_add($this->vars, 'content', $content);

        $this->title = 'Web-icon.com.ua - сайт для Вашего бизнеса';
        $this->title_en = 'Web-icon.com.ua - site for your business';
        $this->description = 'Разработка сайтов любой сложности, уникальный дизайн, seo-продвижение.';
        $this->description_en = 'Разработка сайтов любой сложности, уникальный дизайн, seo-продвижение.';
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

        $portfolio = Portfolio::where('alias', $alias)->first();

        $content = view(env('THEME').'.portfolio')
            ->with('portfolio', $portfolio)
            ->render();

        $this->vars = array_add($this->vars, 'content', $content);

        $this->title = $portfolio->name;
        $this->title_en = $portfolio->name_en;
        $this->description = strip_tags($portfolio->short_desc);
        $this->description_en = strip_tags($portfolio->short_desc_en);
        $this->title_img = $portfolio->img;
        event(new PortfolioHasViewed($portfolio));
        return $this->renderOutput();
    }
}
