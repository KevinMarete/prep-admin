@extends('layouts.app')
@section('content')
@include('styles.home-faq-styles')
@include('styles.section-styles')
    @foreach($sections as $section)
        @if($section->status == 'on')
            <section id = "section_has_bg_img_{{str_slug($section->title)}}" class="hero is-{{$section->size}} is-{{$section->color}} has-text-centered">
                <div id="{{$section->content}}" class ="section_has_bg_overlay">
                        <div>&nbsp;</div>
                    <div class="container">
                        <h1 class="title">@if($section->has_title =='yes'){{$section->title}}@endif</h1>
                            @include('partials.homepage.'.$section->content) 
                        <div>&nbsp;</div>
                    </div>
                </div>
            </section>
        @endif
    @endforeach
@endsection
