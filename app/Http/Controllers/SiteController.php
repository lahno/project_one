<?php

namespace App\Http\Controllers;


use App\Service;

class SiteController extends Controller
{
    //
    protected $title;
    protected $title_en;
    protected $description;
    protected $description_en;
    protected $title_img;

    protected $template;
    protected $vars = array();

    public function __construct()
    {
        //
    }

    protected function renderOutput(){

        $this->vars = array_add($this->vars, 'title', $this->title);
        $this->vars = array_add($this->vars, 'title_en', $this->title_en);
        $this->vars = array_add($this->vars, 'description', $this->description);
        $this->vars = array_add($this->vars, 'description_en', $this->description_en);
        $this->vars = array_add($this->vars, 'title_img', $this->title_img);

        $services = Service::all();
        $scripts = view(env('THEME').'.script')->with('services', $services)->render();
        $this->vars = array_add($this->vars, 'scripts', $scripts);

        return view($this->template)->with($this->vars);
    }

}