<p class="menu-label">Contacts</p>
<ul class="menu-list">
    @foreach($data['contacts'] as $info)
        @foreach($data['contact_attribs'] as $attrib)
       <li>{{$info->$attrib}}</li>
        @endforeach
    @endforeach
</ul>