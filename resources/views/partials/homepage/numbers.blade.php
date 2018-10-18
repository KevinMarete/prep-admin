<div class = "container">
    <div class = "level">
        @foreach($homenumbers as $number)
            <div class = "level-item" >
                <p class ="title"><b>{{number_format($number->number)}}</b></p>
                <p class ="subtitle">{{$number->title}}</p>    
            </div>
        @endforeach
    </div>
</div>