@extends('layouts.app')
@section('content')
@include('styles.dynamicstyles')
    @foreach($sections as $section)
        <section id = {{str_slug($section->title)}} class="hero is-{{$section->size}} is-{{$section->color}} has-text-centered">
            <div>&nbsp;</div>
            <div class="container">
            <h1 class="title">@if($section->has_title =='yes'){{$section->title}}@endif</h1>
                <div class="columns">
                @if($section->columns > 1)
                    @foreach($section->faqs as $faq)
                        <div class="column has-bg-img-tile" id="column-{{str_slug($section->title)}}">
                            <h2 class="title">{{$faq->question}}</h2> 
                        </div> 
                        <div class="column">
                            {{$faq->answer}}      
                        </div>
                    @endforeach
                @endif 
                </div>
                <div>&nbsp;</div>
            </div>
        </section>
    @endforeach
@endsection


