<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Spatie\Sitemap\SitemapGenerator;
use Spatie\Sitemap\Tags\Url;

class SiteMapController extends SiteController
{
    public function __construct()
    {
        //
    }
    public function index()
    {
        SitemapGenerator::create(route('home'))
            ->hasCrawled(function (Url $url) {
                if ($url->segment(1) === 'en' || $url->segment(1) === 'ru') {
                    return null;
                }
                return $url;
            })
            ->getSitemap()
            ->writeToFile(public_path('sitemap.xml'));
    }
}
