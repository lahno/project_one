<div class="blur_bg"><div class="brightness"></div></div>
<div class="content_page">
    <!-- MENU -->
    @include(env('THEME').'.menu')
    <!-- MENU -->
    <div class="main">
        <h1 class="title_page no-pod_title_text text-center">{{trans('main.portfolio')}}</h1>
        <div class="container">
            <div class="row">
                <div class="col s12">
                    @if(empty($portfolios))
                    <div class="grid_sector">
                        <!-- The filter bar -->
                        <ul class="media-boxes-filter tabs" id="filter">
                            <li class="tab"><a class="active" href="#" data-filter="*">{{trans('main.all')}}</a></li>
                            @foreach($category as $item)
                            <li class="tab">
                                <a href="#" data-filter=".category{{$item->id}}">{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $item->name : $item->name_en}}</a>
                            </li>
                            @endforeach
                        </ul>
                        <!-- The grid with media boxes -->
                        <div id="grid">
                            <!-- --------- MEDIA BOX MARKUP --------- -->
                            @foreach($portfolios as $portfolio)
                            <div class="media-box category{{$portfolio->category_id}}">
                                <div class="media-box-image">
                                    <a href="{{route('portfolio',['alias'=>$portfolio->alias])}}"></a>
                                    <div class="substrate"></div>
                                    <div
                                        data-title="{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $portfolio->name : $portfolio->name_en}}"
                                        data-alt="{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $portfolio->short_desc : $portfolio->short_desc_en}}"
                                        data-width="320px" data-height="320px"
                                        data-thumbnail="../img/portfolios/{{$portfolio->img}}">
                                    </div>
                                    <div class="title_box">
                                        <p class="title"><a href="{{route('portfolio',['alias'=>$portfolio->alias])}}">{{(LaravelLocalization::getCurrentLocale() == 'ru') ? $portfolio->name : $portfolio->name_en}}</a></p>
                                        <p class="desc">{{(LaravelLocalization::getCurrentLocale() == 'ru') ? strip_tags($portfolio->short_desc, '<br>') : strip_tags($portfolio->short_desc_en, '<br>')}}</p>
                                    </div>
                                </div>
                                <div class="media-box-content">
                                    <span class="views"><i class="material-icons">visibility</i> {{$portfolio->views}}</span>
                                    @if($portfolio->link)
                                    <a href="{{$portfolio->link}}" target="_blank" class="tooltipped" data-position="left" data-delay="50" data-tooltip="{{trans('main.tooltip_portfolios')}}"><i class="material-icons">open_in_new</i></a>
                                    @endif
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    @else
                        <h1 class="title_page no-pod_title_text text-center" style="padding-top: 10%;">
                            {{trans('main.portfolio_non_1')}}<br>
                            {{trans('main.portfolio_non_2')}}
                        </h1>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>