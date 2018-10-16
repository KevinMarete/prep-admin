<div class = "container">
    <div class = "level">
        @foreach($partners as $partner)
            <div class = "level-item">
                <figure class ="image is-64x64">
                    <a href="{{$partner->website}}"><img src="{{url('storage/partners').'/'.$partner->abbrev.'.png'}}" alt="{{$partner->abbrev}}"></a>
                </figure>
            </div>
        @endforeach
    </div>
</div>