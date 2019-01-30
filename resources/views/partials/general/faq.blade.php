&nbsp;
<div class="container">
   @php $i=0;@endphp
    <div class="columns is-multiline">
    <div class="column is-one-third accordions">
    @foreach($data['faqs_'.$data['page']] as $faq)
            <div class="accordion">
                <div class = "accordion-header toggle" id="heading{{$faq->id}}">
                    <p><strong>{{$faq->question}}</strong></p>
                </div>
                <div id="collapse{{$faq->id}}" class="accordion-body">
                        <div class="media-content accordion-content">
                            &nbsp;
                            <figure class="image is-4by3">
                                @if(empty($faq->image))
                                    <img src="{{url('storage/'.array_random($data['images']))}}" alt="">
                                @else
                                    <img src="{{$faq->image}}" alt="">
                                @endif
                            </figure>
                            &nbsp;
                            <p>{{$faq->answer}}</p>
                            &nbsp;
                        <nav class="level is-mobile">
                            <div class="level-left">
                            <a class="level-item" aria-label="reply">
                                <span class="icon is-small">
                                <i class="fas fa-reply" aria-hidden="true"></i>
                                </span>
                            </a>
                            <a class="level-item" aria-label="retweet">
                                <span class="icon is-small">
                                <i class="fas fa-retweet" aria-hidden="true"></i>
                                </span>
                            </a>
                            <a class="level-item" aria-label="like">
                                <span class="icon is-small">
                                <i class="fas fa-heart" aria-hidden="true"></i>
                                </span>
                            </a>
                            </div>
                        </nav>
                        </div>
                </div>
            </div>
            @php $i++ @endphp
            @if($i%3==0)
            {!!'</div><div class ="column is-one-third accordions">'!!}
        @endif
        @endforeach

    </div>
</div>
&nbsp;

<script>
    var accordions = bulmaAccordion.attach(); 
</script>