// noinspection JSAnnotator
let mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

/*mix.js([
    'resources/assets/js/libs.js',
    'resources/assets/js/main.js',
    // 'resources/assets/libs/media_boxes/plugin/components/Isotope/jquery.isotope.min.js',
    // 'resources/assets/libs/media_boxes/plugin/components/imagesLoaded/jquery.imagesLoaded.min.js',
    // 'resources/assets/libs/media_boxes/plugin/components/Transit/jquery.transit.min.js',
    // 'resources/assets/libs/media_boxes/plugin/components/jQuery Easing/jquery.easing.js',
    // 'resources/assets/libs/media_boxes/plugin/components/Waypoints/waypoints.min.js',
    // 'resources/assets/libs/media_boxes/plugin/components/Modernizr/modernizr.custom.min.js',
    // 'resources/assets/libs/media_boxes/plugin/components/Magnific Popup/jquery.magnific-popup.min.js',
    // 'resources/assets/libs/media_boxes/plugin/components/Fancybox/jquery.fancybox.min.js',
    // 'resources/assets/libs/media_boxes/plugin/js/jquery.mediaBoxes.dropdown.js',
    // 'resources/assets/libs/media_boxes/plugin/js/jquery.mediaBoxes.js'
], 'public/js/main.js');*/
mix.js('resources/assets/js/main.js', 'public/js');

mix.sass('resources/assets/sass/main.sass', 'public/css/main.css');

mix.copyDirectory('resources/assets/img', 'public/img');
mix.copyDirectory('resources/assets/fonts', 'public/fonts');
mix.copyDirectory('resources/assets/js/html5shiv', 'public/js/html5shiv');
mix.copyDirectory('resources/assets/js/respond', 'public/js/respond');
