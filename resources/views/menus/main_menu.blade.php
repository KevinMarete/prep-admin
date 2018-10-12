@foreach($items as $menu_item)
    <a href="{{ $menu_item->link() }}" class="navbar-item" >{{ $menu_item->title }}</a>
@endforeach
