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
    <div class="main animate">
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <h1 class="title_page no-pod_title_text text-center">{{$article->name}}</h1>
                </div>
            </div>
        </div>
        <div class="container box_radius container_breadcram">
            <div class="row m-b-none">
                <div class="col s12">
                    <ul class="breadcram_list">
                        <li><a href="/">{{trans('main.home')}}</a> <i class="material-icons">keyboard_arrow_right</i></li>
                        <li><a href="{{route('blog')}}">Blog</a> <i class="material-icons">keyboard_arrow_right</i></li>
                        <li><a href="{{route('cat_blog', ['category'=>$article->cat->alias])}}">{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $article->cat->name : $article->cat->name_en}}</a> <i class="material-icons">keyboard_arrow_right</i></li>
                        <li>{{$article->name}}</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container container_content color_white box_radius box_shadow">
            <div class="content_page_box">
                <div class="row">
                    <div class="col s12">
                        <blockquote>
                        <p>{{$article->short_desc}}</p>
                        </blockquote>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        {!!$article->desc!!}
                    </div>
                </div>
            </div>
            <div class="bottom_content">
                <div class="row">
                    <div class="col s12">
                        <span class="views"><i class="material-icons">visibility</i> {{$article->views}}</span>
                        <span class="data">{{ $data }}</span>
                        @foreach(json_decode($article->tags) as $item)
                            <div class="chip">
                                <a href="{{route('tag_blog', ['tag'=>$item])}}">{{$item}}</a>
                            </div>
                        @endforeach
                        <div class="right">
                            <div class="fixed-action-btn horizontal right">
                                <a class="btn-floating btn color_primery">
                                    <i class="large material-icons">share</i>
                                </a>
                                <ul>
                                    <li><a href="https://vkontakte.ru/share.php?url={{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}" class="btn-floating color_vk_btn" rel="nofollow"><i class="fa fa-vk"></i></a></li>
                                    <li><a id="shareFB_{{$article->id}}" class="btn-floating color_facebook_btn" rel="nofollow"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="http://plus.google.com/share?url={{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}" class="btn-floating color_google_plus_btn" onclick="window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                                <script>
                                    document.getElementById('shareFB_{{$article->id}}').onclick = function() {
                                        FB.ui({
                                            method: 'share',
                                            mobile_iframe: true,
                                            href: "{{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}"
                                        }, function(response){});
                                    };
                                </script>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="col s12">
                <h3 class="title_block_line">{{trans('main.t_comments')}}</h3>
            </div>
        </div>
        <div class="container container_comment_box color_white box_radius box_shadow">
            <div id="disqus_thread"></div>
            <script>
                /**
                 *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
                 *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/
                /*
                var disqus_config = function () {
                this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
                this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                };
                */
                (function() { // DON'T EDIT BELOW THIS LINE
                    var d = document, s = d.createElement('script');
                    s.src = 'https://web-icon-com-ua.disqus.com/embed.js';
                    s.setAttribute('data-timestamp', +new Date());
                    (d.head || d.body).appendChild(s);
                })();
            </script>
        </div>
        @if(count($similarArticles) > 0)
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <h3 class="title_block_line">{{trans('main.s_articles')}}</h3>
                </div>
                <div class="col s12">
                    <div class="grid_sector_unload">
                        <!-- The grid with media boxes -->
                        <div id="grid_blog_popylar_post">
                            <!-- --------- MEDIA BOX MARKUP --------- -->
                            @foreach($similarArticles as $article)
                                @if(strlen($article->name) >= 80)
                                    @php
                                        $l_t = 'length_title'
                                    @endphp
                                @endif
                            @endforeach
                            @foreach($similarArticles as $article)
                                <div class="media-box">
                                    <div class="media-box-pod_head {{$l_t or ''}}">
                                        <p class="title_pod_head"><a href="{{route('article', ['alias'=>$article->alias, 'category'=>$article->cat->alias])}}">{{$article->name}}</a></p>
                                        <p class="desc">{{str_limit(strip_tags($article->short_desc), 100)}}</p>
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
                                                    <li><a id="shareFB_{{$article->id}}" class="btn-floating color_facebook_btn" rel="nofollow"><i class="fa fa-facebook"></i></a></li>
                                                    <li><a href="http://plus.google.com/share?url={{route('article',['alias'=>$article->alias, 'category'=>$article->cat->alias])}}" class="btn-floating color_google_plus_btn" onclick="window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;"><i class="fa fa-google-plus"></i></a></li>
                                                </ul>
                                                <script>
                                                    document.getElementById('shareFB_{{$article->id}}').onclick = function() {
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
        @endif
    </div>

</div>