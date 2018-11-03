<!--Title-->
<title>@yield('title')</title>

<!--Scripts-->
<script src = "./js/bundle.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

@foreach($data['homeherotext'] as $hero)
<!-- Nav -->
<section class = "hero is-primary is-{{$hero->hero_size}}" id="has_bg_img_{{$hero->page}}" >
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
        <div class = "container has-text-left">
          <h1 class="title is-size-1">{{$hero->title}}</h1>
          <h2 class="subtitle">{{$hero->subtitle}}</h2>
          @if($data['page'] == 'home' || $data['page'] == ' ')
          <!--figure class = "image is-64x64">
                <img src="{{url('/images/prep-logo-cropped.png')}}"  alt="Prep (Kenya)">
            </figure-->
          @endif
        </div>
    </div>
</section>
@include('styles.page-hero-styles')
@endforeach
<!--Hamburger Menu Js for Bulma CSS-->
<script src = "{{url('js/hamburger-menu.js')}}"></script>
