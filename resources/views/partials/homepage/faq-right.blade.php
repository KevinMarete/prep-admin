 <div class="columns is-gapless is-flex">
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
            <div class="column with-bg has-text-centered" style="vertical-align:top !important"  >
               <div class="content center-block" style="display: flex; justify-content: center; align-items: center; height: 100%">
               <p class="px-3 subtitle">{{$faq->answer}}</p>
               </div> 
            </div>
            @php $fr++; @endphp
        @endforeach
    @endif
</div>  