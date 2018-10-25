@foreach($sections as $section)
  @foreach($section->faqs as $faq)
  <style>
     #column-{{str_slug($faq->question)}} {
      background-image: url("storage/faqs/{{str_slug($faq->question)}}.jpg"); 
      background-color: #0000; 
      background-position: center; 
      background-repeat: no-repeat;
      background-size: 500px;
    }
  </style>
  @endforeach
@endforeach
