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
