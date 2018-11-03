

 $('.navbar-item').each(function(e) {
    $(this).click(function(){
      if($('#nav-toggle').hasClass('is-active')){
        $('#nav-toggle').removeClass('is-active');
        $('#prepNav').removeClass('is-active');
      }
    });
  });

  // Open or Close mobile & tablet menu
  $('#nav-toggle').click(function () {
    if($('#nav-toggle').hasClass('is-active')){
      $('#nav-toggle').removeClass('is-active');
      $('#prepNav').removeClass('is-active');
    }else {
      $('#nav-toggle').addClass('is-active');
      $('#prepNav').addClass('is-active');
    }
  });
