<div class = "container">
    <div class = "level">
        @foreach($homenumbers as $number)
            <div class = "level-item">
                <h2 class = "title">{{$number->number}}</h2>
                <p class = "subtitle">{{$number->title}}</p>
            </div>
        @endforeach
    </div>
</div>