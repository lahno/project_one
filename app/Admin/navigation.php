<?php

use SleepingOwl\Admin\Navigation\Page;

// Default check access logic
// AdminNavigation::setAccessLogic(function(Page $page) {
// 	   return auth()->user()->isSuperAdmin();
// });
//
// AdminNavigation::addPage(\App\User::class)->setTitle('test')->setPages(function(Page $page) {
// 	  $page
//		  ->addPage()
//	  	  ->setTitle('Dashboard')
//		  ->setUrl(route('admin.dashboard'))
//		  ->setPriority(100);
//
//	  $page->addPage(\App\User::class);
// });
//
// // or
//
// AdminSection::addMenuPage(\App\User::class)

return [

    [
        'title' => 'User',
        'icon'  => 'fa fa-group',
        'pages' => [
            (new Page(\App\User::class))
                ->setIcon('fa fa-user')
                ->setPriority(0),
            (new Page(\App\Role::class))
                ->setIcon('fa fa-group')
                ->setPriority(100)
        ],
        'priority' => 100
    ],
    [
        'title' => 'Client&Order',
        'icon'  => 'fa fa-group',
        'pages' => [
            (new Page(\App\Client::class))
                ->setIcon('fa fa-user')
                ->setPriority(0),
            (new Page(\App\Order::class))
                ->setIcon('fa fa-group')
                ->setPriority(100),
            (new Page(\App\StatusOrder::class))
                ->setIcon('fa fa-group')
                ->setPriority(200),
            (new Page(\App\Topic::class))
                ->setIcon('fa fa-user')
                ->setPriority(300)
        ],
        'priority' => 200
    ],
    [
        'title' => 'Article',
        'icon'  => 'fa fa-group',
        'pages' => [
            (new Page(\App\Article::class))
                ->setIcon('fa fa-user')
                ->setPriority(0),
            (new Page(\App\Category_article::class))
                ->setIcon('fa fa-user')
                ->setPriority(100),
            (new Page(\App\Page::class))
                ->setIcon('fa fa-user')
                ->setPriority(200)
        ],
        'priority' => 300
    ],
    [
        'title' => 'Portfolios',
        'icon'  => 'fa fa-group',
        'pages' => [
            (new Page(\App\Portfolio::class))
                ->setIcon('fa fa-user')
                ->setPriority(0),
            (new Page(\App\Category_portfolio::class))
                ->setIcon('fa fa-user')
                ->setPriority(100)
        ],
        'priority' => 400
    ],
    [
        'title' => 'Service',
        'icon'  => 'fa fa-group',
        'pages' => [
            (new Page(\App\Service::class))
                ->setIcon('fa fa-user')
                ->setPriority(0)
        ],
        'priority' => 500
    ],

    // Examples
    // [
    //    'title' => 'Content',
    //    'pages' => [
    //
    //        \App\User::class,
    //
    //        // or
    //
    //        (new Page(\App\User::class))
    //            ->setPriority(100)
    //            ->setIcon('fa fa-user')
    //            ->setUrl('users')
    //            ->setAccessLogic(function (Page $page) {
    //                return auth()->user()->isSuperAdmin();
    //            }),
    //
    //        // or
    //
    //        new Page([
    //            'title'    => 'News',
    //            'priority' => 200,
    //            'model'    => \App\News::class
    //        ]),
    //
    //        // or
    //        (new Page(/* ... */))->setPages(function (Page $page) {
    //            $page->addPage([
    //                'title'    => 'Blog',
    //                'priority' => 100,
    //                'model'    => \App\Blog::class
	//		      ));
    //
	//		      $page->addPage(\App\Blog::class);
    //	      }),
    //
    //        // or
    //
    //        [
    //            'title'       => 'News',
    //            'priority'    => 300,
    //            'accessLogic' => function ($page) {
    //                return $page->isActive();
    //		      },
    //            'pages'       => [
    //
    //                // ...
    //
    //            ]
    //        ]
    //    ]
    // ]
];