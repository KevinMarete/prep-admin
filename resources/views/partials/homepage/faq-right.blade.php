<div class="columns">
  @if($section->columns > 1)
      @foreach($section->faqs as $faq)
          <div class="column has-bg-img-tile" id="column-{{str_slug($section->title)}}">
              <h2 class="title">{{$faq->question}}</h2>
          </div>
          <div class="column">
              {{$faq->answer}}
          </div>
      @endforeach
  @endif
</div>
