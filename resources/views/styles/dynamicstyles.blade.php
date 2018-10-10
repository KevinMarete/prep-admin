@foreach($sections as $section)
  @foreach($section->faqs as $faq)
  <style>
     #column-{{str_slug($faq->question)}} {
      background-image: url("storage/faqs/{{str_slug($faq->question)}}.jpeg"); 
      background-color: #0000; 
      background-position: center; 
      background-repeat: no-repeat;
      background-size: cover;
    }
  </style>
  @endforeach
@endforeach
