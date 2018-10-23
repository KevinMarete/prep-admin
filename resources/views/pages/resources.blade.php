@extends('layouts.app')
@section('content')
@php $r=0; $g=0; @endphp
<div class = "container">
    <div class = "tabs is-centered">
        <ul class = "nav nav-tabs" id="nav-tab">
        <li class = "nav-item" ><a id="gallery_tab" data-toggle="tab" class="nav-link" href="#gallery_tabContent" >Gallery</a></li> 
        @foreach($data['resources_folders'] as $resource)
            @php $titles = explode('/', $resource) @endphp
            <li class="nav-item" >
                <a id="{{$titles[1]}}_tab" data-toggle="tab" class="nav-link" href="#{{str_slug($titles[1])}}_tabContent">{{$titles[1]}}</a>
            </li>
        @endforeach
        </ul>
    </div>
    <div class = "tab-content" id="nav-tabContent">
        <div id = "gallery_tabContent" class="columns tab-pane fade" >
            <div class ="columns" >
            @foreach($data['galleries'] as $gallery)
            @php $galleryname = explode('/', $gallery) @endphp
            <div class = "column is-one-third">
                <div class = "box">
                    @php $gname = pathinfo($galleryname[1], PATHINFO_FILENAME); @endphp
                    <h2 class = "title">{{$gname}}</h2>
                    <div>
                        <figure class = "image is-4by5">
                            <a><img src="{{url('storage/').'/'.$data['galleries_'.$gname][0]}}" alt=""></a>
                        </figure>
                    </div>
                </div>
            </div>
            @php $g++ @endphp
            @if($g%3==0)
                {!!'</div><div class ="columns">'!!}
            @endif
            @endforeach
            </div>
        </div>
    
    @foreach($data['resources_folders'] as $resource)
    @php $titles = explode('/', $resource) @endphp
    <div id = "{{str_slug($titles[1])}}_tabContent" class="columns tab-pane fade">
    <div class = "columns" >
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
                        <a class = "button" href="{{url('storage/').'/'.$file}}">Download</a>
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
    </div>
    </div>
    @endforeach
</div>
</div>
@endsection

<script>
    $('#nav-tab a[href="#gallery_tabContent"]').tab('show')
</script>