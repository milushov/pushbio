class @Router extends Backbone.Router

  views  = 'home form new history faq error'.split(/\s/)
  routes = Object.extended()

  views.each (page) -> routes[page] = page

  routes: routes.merge('': 'route')

  views.each (view) =>
    viewClass = view.camelize() + 'View'
    @::[view] = -> new viewClass()

  route: ->
    # TODO: Try to restore last opened page (if possible)
    # TODO: ... or redirect to home if user is not logged in
    # TODO: ... or redirect to form

  requireAuth = ['form', 'new']

  checkAccess: (page) ->
    not requireAuth.any(page) or @userLoggedIn()

  userLoggedIn: ->
    currentUser.loggedIn()