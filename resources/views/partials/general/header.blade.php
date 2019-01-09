<!--Title-->
@include('partials.general.meta')
@include('partials.general.analytics')

<title>@yield('title')</title>

<!--Scripts-->
@include('partials.general.scripts')
@foreach($data['homeherotext'] as $hero)
<!-- Nav -->
<section class = "hero is-primary is-{{$hero->hero_size}} has-carousel" id="has_bg_img_{{$hero->page}}" >
    <div class = "hero-head">
        <nav class="navbar is-transparent">
            <div class = "container">
                <div class="navbar-brand">
                    <a class="navbar-item" href="/" >
                        <img src="{{url('/storage/logos/yVL7KMxlAKmFnlPGcEJkxpMsortoAdZ5pq8QuBrv.png')}}" alt="Prep (Kenya)">
                    </a>
                    <div id="nav-toggle"class="navbar-burger burger" data-target="prepNav">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </div>
                <div id="prepNav" class="navbar-menu">
                    <div class="navbar-end">
                         {{menu('main', 'menus.main_menu')}}
                    </div>
                </div>
            </div>
        </nav>
    </div>
    <div class ="hero-body">
        @if($data['page'] != 'home' && $data['page'] != ' ')
            <div class = "container has-text-left">
            <h1 class="title is-size-1">{{$hero->title}}</h1>
            <h2 class="subtitle">{{$hero->subtitle}}</h2>
            
            <!--figure class = "image is-64x64">
                    <img src="{{url('/images/prep-logo-cropped.png')}}"  alt="Prep (Kenya)">
            </figure-->
            
            </div>
        @endif
        <!-- Add Hero Carousel for Home here -->
        @if($data['page'] == 'home' || $data['page'] == ' ')
            <div id="homecarouselgrad">
            <div class="hero-carousel carousel-animated carousel-animate-fade" data-autoplay="true">
                <div class='carousel-container'>
            @foreach($data['carousel_images'] as $cimage)
                <div class='carousel-item has-background is-active'>
                    <img class="is-background carousel-image" src="{{url('storage/'.$cimage)}}" alt="" />
                </div>    
            @endforeach
            </div>
            <div class="carousel-navigation is-overlay">
                <div class="carousel-nav-left">
                    <i class="fa fa-chevron-left" aria-hidden="true"></i>
                </div>
                <div class="carousel-nav-right">
                    <i class="fa fa-chevron-right" aria-hidden="true"></i>
                </div>
            </div>
            </div>
            </div>
        @endif
    </div>
    @include('styles.page-hero-styles')
</section>
@endforeach
<!--Hamburger Menu Js for Bulma CSS-->
<script src = "{{url('js/hamburger-menu.js')}}"></script>
<script>
    var carousels = bulmaCarousel.attach(); // carousels now contains an array of all Carousel instances
</script>

