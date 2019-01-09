@foreach($data['hero_imgs'] as $hero_img)
  @if($loop->last)
    <style>
      #has_bg_img_{{str_slug($hero->page)}} {
        background-image: url("{{'storage/'.$hero_img}}"), linear-gradient(to bottom, rgba(0,0,0,0.45) 0%,rgba(0,0,0,0) 100%); -webkit-linear-gradient(top, rgba(0,0,0,0.45) 0%,rgba(0,0,0,0) 100%);
        -moz-linear-gradient(top, rgba(0,0,0,0.45) 0%, rgba(0,0,0,0) 100%); filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6000000', endColorstr='#00000000',GradientType=0 );
        background-color: #0000; 
        background-position: center; 
        background-repeat: no-repeat;
        background-size: cover;
        background-blend-mode:darken;
      }
    </style>
  @endif
@endforeach


