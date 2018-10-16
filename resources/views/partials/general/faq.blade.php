&nbsp;
<div class="container">
   @php $i=0 @endphp
    <div class="columns">
    @foreach($data['faqs_'.$data['page']] as $faq)
        <div class="column is-one-third">
            <div class="box">
                    <div class="media-content">
                        <p><strong>{{$faq->question}}</strong></p>
                        &nbsp;
                        <figure class="image is-square">
                            <img src="{{url('storage/faqs/').str_slug($faq->question)}}" alt="">
                        </figure>
                        &nbsp;
                        <p>{{$faq->answer}}</p>
                    </div>
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
        @php $i++ @endphp
        @if($i%3==0)
            {!!'</div><div class ="columns">'!!}
        @endif
        @endforeach
</div>
&nbsp;