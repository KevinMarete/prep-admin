@extends('layouts.app')
@section('content')
@php $r=0; $g=0; @endphp
<div class = "container">
    <!--Spacer Div-->
    <div class ="mt-2"></div>
    
    <!--Tabs Nav-->
    <div class = "tabs is-centered">
        <ul class = "nav nav-tabs" id="nav-tab">
        <li class = "nav-item" ><a id="gallery_tab" data-toggle="tab" class="nav-link active" href="#gallery_tabContent" >Gallery</a></li> 
        @foreach($data['resources_folders'] as $resource)
            @php $titles = explode('/', $resource) @endphp
            <li class="nav-item" >
                <a id="{{$titles[1]}}_tab" data-toggle="tab" class="nav-link" href="#{{str_slug($titles[1])}}_tabContent">{{$titles[1]}}</a>
            </li>
        @endforeach
        </ul>
    </div>

    <!--Gallery-->
    @include('partials.general.gallery')
    
    <!--Document Resources-->
    @foreach($data['resources_folders'] as $resource)
    @php $titles = explode('/', $resource) @endphp
    <div id = "{{str_slug($titles[1])}}_tabContent" class="columns tab-pane fade">
    <div class = "columns" >
        @if(!empty($data['resource_files_'.$titles[1]]))
        @foreach($data['resource_files_'.$titles[1]] as $file)
        @php $filenames = explode('/', $file) @endphp
            <div class="column is-one-third">
                <div class  ="box">
                    @php $fname = pathinfo($filenames[2], PATHINFO_FILENAME); @endphp
                    <h2 class ="title">{{$fname}}</h2>
                    <div>
                    <figure class = "image is-4by5">
                        <img src="{{url('storage/pdfthumbs/').'/'.$fname.'.png'}}" alt="PDF">
                    </figure>
                    </div>
                    &nbsp;
                <div class="field">
                    <div class="control">
                        &nbsp;
                        <a target="_blank" class = "button" href="{{url('storage/').'/'.$file}}">Download</a>
                        &nbsp;
                    </div>
                </div>
                </div>                
            </div>
            @php $r++ @endphp
            @if($r%3==0)
                {!!'</div><div class ="columns">'!!}
            @endif
        @endforeach
        @else
            @include('partials.general.no-content')
        @endif
    </div>
    </div>
    @endforeach
</div>
</div>
@endsection
