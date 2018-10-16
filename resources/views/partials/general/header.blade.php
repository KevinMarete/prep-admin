<!--Title-->
<title>@yield('title')</title>

<!--Scripts-->
<script src = "./js/bundle.js"></script>

@foreach($data['homeherotext'] as $hero)
<!-- Nav -->
<section class = "hero is-primary is-{{$hero->hero_size}}" id="has_bg_img_{{$hero->page}}" >
    <div class = "hero-head">
        <nav class="navbar is-transparent">
            <div class = "container">
                <div class="navbar-brand">
                    <a class="navbar-item" href="/" >
                        <img src="./images/prep-logo-cropped.png" alt="Prep (Kenya)">
                    </a>
                    <div class="navbar-burger burger" data-target="prepNav">
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
        <div class = "container has-text-left">
          <h1 class="title is-size-1">{{$hero->title}}</h1>
          <h2 class="subtitle">{{$hero->subtitle}}</h2>
        </div>
    </div>
</section>
@include('styles.page-hero-styles')
@endforeach