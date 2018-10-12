@foreach($items as $menu_item)
    <li><a href="{{ $menu_item->link() }}" class="navbar-item" >{{ $menu_item->title }}</a></li>
@endforeach
