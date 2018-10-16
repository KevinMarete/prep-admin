<div class="columns" id="doublefaq" >
      @foreach($section->faqs as $faq)
          <div class="column">
              <h2 class="title">{{$faq->question}}</h2>
              <p class>{{$faq->answer}}</p>
          </div>
      @endforeach
</div>
