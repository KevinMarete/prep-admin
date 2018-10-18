
<div class = "modal" id="rast-tool">
    <div class = "modal-card">
        <header class="modal-card-head">
        <p class="modal-card-title">{{$section->title}}</p>
        <button class="delete modal-close" aria-label="close"></button>
        </header>
        <section class = "modal-card-body">
            <div id="section_has_bg_img{{$section->content}}" >
                @foreach($data['rast'] as $rast)
                @if($rast->type == 'question')
                <div class = "box">
                    <div class ="field">
                    <p class="subtitle has-text-justified">{{$rast->question}}</p>
                    <div class = "control">
                        @php $options = explode(',' , $rast->options);  @endphp
                        @foreach($options as $option)
                            <label class = "radio">
                                <input type="radio" name="rast-{{$rast->id}}" value = "{{$option}}" > 
                                {{$option}}
                            </label>
                        @endforeach()
                    </div>
                </div>
            </div>
            @endif
            @endforeach
    </div>
    </section>
    <footer class = "modal-card-footer">
        @foreach($data['misc'] as $misc)
            <div class = "blockquote">{{$misc->content}}</div>
        @endforeach
    </footer>
    <button class = "modal-close is-large" aria-label="close" ></button>
</div>
</div>
<script>
    //Toggle classes
    function toggleModalClasses(event) {
        var modalId = event.currentTarget.dataset.id;
        var modal = $(modalId);
        modal.toggleClass('is-active');
        $('html').toggleClass('is-clipped');
    }
    //Open and close modal
    $('#pop-rast').click(toggleModalClasses);
    $('.modal-close').click(toggleModalClasses);

</script>