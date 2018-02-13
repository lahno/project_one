<?php

namespace App\Providers;

use SleepingOwl\Admin\Providers\AdminSectionsServiceProvider as ServiceProvider;

class AdminSectionsServiceProvider extends ServiceProvider
{

    /**
     * @var array
     */
    protected $sections = [
        \App\Role::class => 'App\Http\Admin\Roles',
        \App\User::class => 'App\Http\Admin\Users',
        \App\StatusOrder::class => 'App\Http\Admin\StatusOrders',
        \App\Client::class => 'App\Http\Admin\Clients',
        \App\Order::class => 'App\Http\Admin\Orders',
        \App\Article::class => 'App\Http\Admin\Articles',
        \App\Category_article::class => 'App\Http\Admin\Category_articles',
        \App\Portfolio::class => 'App\Http\Admin\Portfolios',
        \App\Category_portfolio::class => 'App\Http\Admin\Category_portfolios',

        \App\Page::class => 'App\Http\Admin\Pages',
        \App\Service::class => 'App\Http\Admin\Services',
        \App\Review::class => 'App\Http\Admin\Reviews',
        \App\Topic::class => 'App\Http\Admin\Topics',
    ];

    /**
     * Register sections.
     *
     * @return void
     */
    public function boot(\SleepingOwl\Admin\Admin $admin)
    {
    	//

        parent::boot($admin);
    }
}
