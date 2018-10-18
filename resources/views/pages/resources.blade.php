@extends('layouts.app')
@section('content')
<div class = "container">
    <div class = "tabs is-centered">
        <ul class = "nav nav-tabs" id="nav-tab"> 
        @foreach($data['resources_folders'] as $resource)
            @php $titles = explode('/', $resource) @endphp
            <li class="nav-item" >
                <a id="{{$titles[1]}}_tab" data-toggle="tab" class="nav-link" href="#{{str_slug($titles[1])}}_tabContent">{{$titles[1]}}</a>
            </li>
        @endforeach
        </ul>
    </div>
    <div class = "tab-content" id="nav-tabContent">
    @foreach($data['resources_folders'] as $resource)
    @php $titles = explode('/', $resource) @endphp
    <div id = "{{str_slug($titles[1])}}_tabContent" class="columns tab-pane fade">
    @foreach($data['resource_files_'.$titles[1]] as $file)
    @php $filenames = explode('/', $file) @endphp
        <div class="column is-one-third">
            <div class  = "box">
                @php $fname = pathinfo($filenames[2], PATHINFO_FILENAME); @endphp
                <h2 class ="title">{{$fname}}</h2>
                <div>
                <figure class = "image is-4by3">
                    <img src="{{url('storage/pdfthumbs/').'/'.$fname.'.png'}}" alt="PDF">
                </figure>
                </div>
                &nbsp;
            <div class="field">
                <div class="control">
                    &nbsp;
                    <a class = "button" href="{{url('storage/').$file}}">Download</a>
                    &nbsp;
                </div>
            </div>

            </div>
            
        </div>
        <a></a>
    @endforeach
    </div>
    @endforeach
</div>
</div>
@endsection

<script>
    $('#myTab a[href="#profile"]').tab('show')
</script>