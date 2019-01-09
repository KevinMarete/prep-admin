@foreach($items as $menu_item)
    <a href="{{ url($menu_item->link()) }}" class="navbar-item h5 has-text-warning" >{{ $menu_item->title }}</a>
@endforeach
