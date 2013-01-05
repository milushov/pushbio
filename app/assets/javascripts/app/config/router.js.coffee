class App.Router extends Backbone.Router

  views  = 'home form new history faq error'.split(/\s/)
  routes = Object.extended()

  views.each (page) -> routes[page] = page

  views.each (page) =>
    viewClass = App[page.camelize() + 'View']
    @::[page] = ->
      if @checkAccess(page)
        new viewClass(page: page)
      else
        @navigate('')

  routes: routes.merge('': 'root')

  root: ->
    @navigate \
      if @hasLastPage() and @checkAccess(@lastPage())
        @lastPage()
      else if app.user.loggedIn()
        'form'
      else
        'home'

  requireAuth = ['form', 'new']

  checkAccess: (page) ->
    not requireAuth.any(page) or app.user.loggedIn()

  lastPage: ->
    app.settings.get('lastPage')

  hasLastPage: ->
    @lastPage()?
