<div class = "hero-body">
<div class="columns" id="section_has_bg_img{{$section->content}}">
    @php $df=0;@endphp
      @foreach($section->faqs as $faq)
          <div class="column">
              <h2 class="title">{{$faq->question}}</h2>
              <figure class = "image is-4by3">
                    <img src="{{'storage/'.$data['section_imgs_'.str_slug($section->title)][$df]}}" alt="{{$faq->question}}">    
              </figure>
              &nbsp;
              <p class>{{$faq->answer}}</p>
              @if($faq->question == 'Is PrEP for Everyone')
                &nbsp;
                <p><b>Is PrEP for you? <a class="button" href="#rat">Find out</a></b></p>
              @endif
          </div>
          @php $df++; @endphp
      @endforeach
</div>
</div>