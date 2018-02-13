<div class="blur_bg"><div class="brightness"></div></div>
<div class="content_page">
    <!-- MENU -->
@include(env('THEME').'.menu')
<!-- MENU -->
    <div class="main">
        <h1 class="title_page no-pod_title_text text-center">{{trans('main.reviews')}}</h1>
        <div class="container reviews_container">
            <div class="row m-b-none">
                <div class="col s12 block_container">
                    <div class="owl-carousel reviews-carousel">
                        @foreach($reviews as $review)
                            <div class="item box_radius box_shadow hoverable">
                                <div class="header_cart">
                                    <div class="img" style="background: url(/{{$review->avatar}}) center no-repeat;"></div>
                                    <p class="name">{{$review->name}}</p>
                                    <p class="pod_name">{{$review->type_case}}</p>
                                </div>
                                <div class="content_cart">
                                    {!!$review->desc!!}
                                </div>
                                <div class="bottom_cart">
                                    <p class="date text-right">{{$review->created_at->toDateString()}}</p>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>