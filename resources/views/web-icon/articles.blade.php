<script>
    /*
    * FB SHARE SCRIPT ADD
     */
    window.fbAsyncInit = function() {
        FB.init({
            appId            : '{{env('FB_KEY')}}',
            autoLogAppEvents : true,
            xfbml            : true,
            version          : 'v2.10'
        });
        FB.AppEvents.logPageView();
    };
    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<div class="blur_bg"><div class="brightness"></div></div>
<div class="content_page">
    <!-- MENU -->
    @include(env('THEME').'.menu')
    <!-- MENU -->
    <div class="main">
        <h1 class="title_page no-pod_title_text text-center">Blog</h1>
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <div class="grid_sector">
                        @if($cat && $cat !== -1)
                            <p class="pod_title category_name block_title_darck text-center box_radius">
                                {{(LaravelLocalization::getCurrentLocale() == 'ru') ? $cat->name : $cat->name_en}}
                            </p>
                        @endif
                        <!-- The grid with media boxes -->
                        <div id="grid_blog">
                            <!-- --------- MEDIA BOX MARKUP --------- -->
                            <!-- ***** БЛОК ПОИСКА ***** -->
                            {{--<div class="media-box search_box">
                                <div class="col s12">
                                    <form>
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">search</i>
                                            <input id="icon_prefix" type="text">
                                            <label for="icon_prefix">Поиск...</label>
                                        </div>
                                    </form>
                                </div>
                            </div>--}}
                            <!-- ***** КОНЕЦ БЛОК ПОИСКА ***** -->
                            @php Carbon\Carbon::setLocale(LaravelLocalization::getCurrentLocale()); @endphp
                            @foreach($articles as $article)
                            <div class="media-box category{{$article->category_id}}">
                                <div class="media-box-head">
                                    <p class="title_head">
                                        @if($cat && $cat !== -1)
                                            <a href="{{route('blog')}}">Blog <i class="material-icons">play_arrow</i></a> <span>{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $article->cat->name : $article->cat->name_en}}</span>
                                        @elseif($cat == -1)
                                            <a href="{{route('blog')}}">Blog</a> <a href="{{route('cat_blog', ['category'=>$article->cat->alias])}}"><i class="material-icons">play_arrow</i> {{(LaravelLocalization::getCurrentLocale() == 'ru') ? $article->cat->name : $article->cat->name_en}}</a>
                                        @else
                                            <span>Blog</span> <a href="{{route('cat_blog', ['category'=>$article->cat->alias])}}"><i class="material-icons">play_arrow</i> {{(LaravelLocalization::getCurrentLocale() == 'ru') ? $article->cat->name : $article->cat->name_en}}</a>
                                        @endif
                                    </p>
                                    <span class="date right">{{ ($article->created_at)?$article->created_at->diffForHumans(null, true):'' }}</span>
                                </div>
                                <div class="media-box-pod_head">
                                    <a href="{{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}" class="title_pod_head">{{$article->name}}</a>
                                    <p class="desc">{{strip_tags($article->short_desc)}}</p>
                                </div>
                                <div class="media-box-image">
                                    <a href="{{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}"></a>
                                    <div class="substrate"></div>
                                    <div data-title="{{$article->name}}" data-alt="{{$article->short_desc}}" data-width="590" data-height="332" data-thumbnail="/{{$article->img}}"></div>
                                </div>
                                <div class="media-box-bottom">
                                    <div class="left">
                                        <span class="views"><i class="material-icons">visibility</i> {{$article->views}}</span>
                                    </div>
                                    <div class="right">
                                        @php
                                            $key = array_search(route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias]), array_column($commArray, 'link'));
                                            $countComments = $commArray[$key]['posts'];
                                        @endphp
                                        <span class="reviews"><i class="material-icons">insert_comment</i> {{$countComments}}</span>
                                        <div class="fixed-action-btn right">
                                            <a class="btn-floating btn color_primery">
                                                <i class="large material-icons">share</i>
                                            </a>
                                            <ul>
                                                <li><a href="https://vkontakte.ru/share.php?url={{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}" class="btn-floating color_vk_btn" rel="nofollow"><i class="fa fa-vk"></i></a></li>
                                                <li><a id="shareFB_list_{{$article->id}}" class="btn-floating color_facebook_btn" rel="nofollow"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="http://plus.google.com/share?url={{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}" class="btn-floating color_google_plus_btn" onclick="window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"><i class="fa fa-google-plus"></i></a></li>
                                            </ul>
                                            <script>
                                                document.getElementById('shareFB_list_{{$article->id}}').onclick = function() {
                                                    FB.ui({
                                                        method: 'share',
                                                        mobile_iframe: true,
                                                        href: "{{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}"
                                                    }, function(response){});
                                                };
                                            </script>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <h3 class="title_block_line">{{trans('main.f_articles')}}</h3>
                </div>
                <div class="col s12">
                    <div class="grid_sector_unload">
                        <!-- The grid with media boxes -->
                        <div id="grid_blog_popylar_post">
                            <!-- --------- MEDIA BOX MARKUP --------- -->
                            @foreach($fArticles as $article)
                                @if(strlen($article->name) >= 80)
                                    @php
                                        $l_t = 'length_title'
                                    @endphp
                                @endif
                            @endforeach
                            @foreach($fArticles as $article)
                            <div class="media-box">
                                <div class="media-box-pod_head {{$l_t or ''}}">
                                    <p class="title_pod_head"><a href="{{route('article', ['alias'=>$article->alias, 'category'=>$article->cat->alias])}}">{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $article->name : $article->name_en}}</a></p>
                                    <p class="desc">{{str_limit($article->short_desc, 100)}}</p>
                                </div>
                                <div class="media-box-image">
                                    <a href="{{route('article', ['alias'=>$article->alias, 'category'=>$article->cat->alias])}}"></a>
                                    <div class="substrate"></div>
                                    <div data-title="{{$article->name}}" data-alt="{{$article->short_desc}}" data-width="590" data-height="332" data-thumbnail="/{{$article->img}}"></div>
                                </div>
                                <div class="media-box-bottom">
                                    <div class="left">
                                        <span class="views"><i class="material-icons">visibility</i> {{$article->views}}</span>
                                    </div>
                                    <div class="right">
                                        @php
                                            $key = array_search(route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias]), array_column($commArray, 'link'));
                                            $countComments = $commArray[$key]['posts'];
                                        @endphp
                                        <span class="reviews"><i class="material-icons">insert_comment</i> {{$countComments}}</span>
                                        <div class="fixed-action-btn right">
                                            <a class="btn-floating btn color_primery">
                                                <i class="large material-icons">share</i>
                                            </a>
                                            <ul>
                                                <li><a href="https://vkontakte.ru/share.php?url={{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}" class="btn-floating color_vk_btn" rel="nofollow"><i class="fa fa-vk"></i></a></li>
                                                <li><a onclick="postFB('{{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}')" id="shareFB_{{$article->id}}" class="btn-floating color_facebook_btn" rel="nofollow"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="http://plus.google.com/share?url={{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}" class="btn-floating color_google_plus_btn" onclick="window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"><i class="fa fa-google-plus"></i></a></li>
                                            </ul>
                                            {{--<script>
                                                document.getElementById('shareFB_{{$article->id}}').onclick = function() {
                                                    FB.ui({
                                                        method: 'share',
                                                        mobile_iframe: true,
                                                        href: "{{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}"
                                                    }, function(response){});
                                                };
                                            </script>--}}
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>