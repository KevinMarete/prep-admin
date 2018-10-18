@foreach($data['hero_imgs'] as $hero_img)
  @if($loop->last)
    <style>
      #has_bg_img_{{str_slug($hero->page)}} {
        background-image: url("{{'storage/'.$hero_img}}"); 
        background-color: #0000; 
        background-position: center; 
        background-repeat: no-repeat;
        background-size: cover;
        background-blend-mode:darken;
      }
    </style>
  @endif
@endforeach

