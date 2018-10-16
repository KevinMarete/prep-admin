@extends('layouts.app')
@section('content')
@include('styles.home-faq-styles')
    @foreach($sections as $section)
        <section id = {{str_slug($section->title)}} class="hero is-{{$section->size}} is-{{$section->color}} has-text-centered">
            <div>&nbsp;</div>
            <div class="container">
            <h1 class="title">@if($section->has_title =='yes'){{$section->title}}@endif</h1>
                @include('partials.homepage.'.$section->content) 
            <div>&nbsp;</div>
            </div>
        </section>
    @endforeach
@endsection
