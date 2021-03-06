class @Router extends Backbone.Router

  @views  = 'home form new history faq error'.split(/\s/)
  routes = Object.extended()

  @views.each (page) -> routes[page] = page

  routes: routes.merge('': 'root')

  @views.each (view) =>
    viewClass = view.camelize() + 'View'
    @::[view] = -> new viewClass()

  root: ->
    @navigate \
      # Try to restore last opened page (if possible)
      if (lastPage = settings.get('lastPage')) and @checkAccess(lastPage)
        lastPage

      # Redirect to form if user is logged in
      else if currentUser.loggedIn()
        'form'

      # Or redirect to home
      else
        'home'

  requireAuth = ['form', 'new']

  checkAccess: (page) ->
    not requireAuth.any(page) or currentUser.loggedIn()
