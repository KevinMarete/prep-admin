 <div class="columns is-gapless is-flex" style="display:table">
    @if($section->columns > 1)
    @php $fr=0; @endphp
        @foreach($section->faqs as $faq)
            <div class="column inline-flex has-bg-img-tile" id="columns-{{str_slug($section->title)}}">
                <h2 class="title">{{$faq->question}}</h2>
                <figure class = "image is-4by3">
               @foreach($data['section_imgs_'.str_slug($section->title)] as $img)
                    <img src="{{'storage/'.$img}}" alt="{{$faq->question}}">    
              @endforeach
              </figure>
            </div>
            <div class="column with-bg">
                {{$faq->answer}}
            </div>
            @php $fr++; @endphp
        @endforeach
    @endif
</div>  