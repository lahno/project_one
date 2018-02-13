<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group([
    'prefix' => LaravelLocalization::setLocale(),
    'middleware' => [ 'localeSessionRedirect', 'localizationRedirect', 'localeViewPath' ]
], function() {

    Route::resource('/', 'IndexController', [
        'only' => ['index'],
        'names' => [
            'index' => 'home'
        ],
    ]);

    /*** --- ПОРТФОЛИО --- ***/
    Route::get('portfolios', 'PortfolioController@index')->name('portfolios');
    Route::get('portfolios/{alias}', 'PortfolioController@show')->name('portfolio');


    /*** --- УСЛУГИ --- ***/
    Route::get('services', 'ServiceController@index')->name('services');
    Route::get('services/{alias}', 'ServiceController@show')->name('service');


    /*** --- БЛОГ --- ***/
    Route::get('blog', 'BlogController@index')->name('blog');
    Route::get('blog/{category?}', 'BlogController@index')->name('cat_blog');
    Route::get('blog/{category?}/{alias}', 'BlogController@show')->name('article');
    Route::get('blog_tag/{tag}', 'BlogController@showTag')->name('tag_blog');


    /*** --- ОТЗЫВЫ --- ***/
    Route::get('reviews', 'ReviewsController@index')->name('reviews');


    /*** --- СТРАНИЦЫ --- ***/
    Route::get('pages/{page}', 'PageController@show')->name('page');


    /*** --- КОНТАКТЫ --- ***/
    Route::get('contact', 'ContactController@index')->name('contact');

    /*** --- ОТПРАВКА ФОРМ --- ***/
    Route::post('post_order', 'PostController@order')->name('post_order');
    Route::post('post_contact', 'PostController@contact')->name('post_contact');
    Route::post('post_service', 'PostController@service')->name('post_service');
});

/*** --- АВТОРИЗАЦИЯ --- ***/
Auth::routes();

/*** --- ЗАГРУЗКА ИЗОБРАЖЕНИЙ CKEDITOR --- ***/
Route::post('/storage/images_admin', [
    'as'   => 'upload.image.s3',
    'uses' => "ImageController@storeAdmin"
]);

/*** --- SITEMAP --- ***/
Route::get('sitemap', 'SiteMapController@index')->name('sitemap');