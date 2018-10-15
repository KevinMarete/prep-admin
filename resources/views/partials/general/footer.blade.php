<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAEUjRuSW4K7TbLLlSLZ2uNqr7UdIxw364&callback=initMap" async defer></script>
<footer class="footer">
  <div class="container">
    <div class="columns">
      <div class="column">
        <p class="menu-label">Users</p>
        <ul class="menu-list">
            {{menu('users', 'menus.users_menu')}}
        </ul>
      </div>
      <div class="column">
        <p class="menu-label">Resources</p>
        <ul class="menu-list">
          {{menu('resources', 'menus.resources_menu')}}
        </ul>
      </div>
      <div class="column">
        @include('partials.general.contacts')
      </div>
    </div>
  </div>
</footer>
