<div class = "tab-content" id="nav-tabContent">
        <div id = "gallery_tabContent" class="columns tab-pane active in" >
            <div class ="columns" >
            @if(!empty($data['galleries']))
            @foreach($data['galleries'] as $gallery)
            @php $galleryname = explode('/', $gallery) @endphp
            <div class = "column is-one-third">
                <div class = "box">
                    @php $gname = pathinfo($galleryname[1], PATHINFO_FILENAME); @endphp
                    <h2 class = "title">{{$gname}}</h2>
                    <div>
                        <figure class = "image is-4by5">
                            <a data-toggle="modal" data-target="#modal{{str_slug($gname)}}" ><img src="{{url('storage/').'/'.$data['galleries_'.$gname][0]}}" alt=""></a>
                        </figure>
                    </div>
                </div>
            </div>
            @php $g++ @endphp
            @if($g%3==0)
                {!!'</div><div class ="columns">'!!}
            @endif

            <div id="modal{{str_slug($gname)}}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="modal{{str_slug($gname)}}Title" aria-hidden="true" >
                <div class="modal-dialog modal-dialog-centred" role="document">
                    <div class = "modal-content">
                        <div class = "modal-header">
                            <h5 class = "modal-title" id="modal{{str_slug($gname)}}Title">{{$gname}}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class = "modal-body">
                            <div id = "carousel{{str_slug($gname)}}" class="carousel slide" data-ride="carousel">
                                <ol class = "carousel-indicators">
                                    @foreach($data['galleries_'.$gname] as $photo)
                                        <li data-target = "carousel{{str_slug($gname)}}" data-slide-to="{{$loop->index}}" class="@if($loop->first){{'active'}}@endif"></li>
                                    @endforeach
                                </ol>
                                <div class = "carousel-inner">
                                    @foreach($data['galleries_'.$gname] as $photo)
                                        <div class = "carousel-item">
                                            <img src="" alt="">
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            @endforeach
            @else
                @include('partials.general.no-content')
            @endif
    </div>
</div>