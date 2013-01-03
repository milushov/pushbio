class App.Router extends Backbone.Router

  do =>

    @views  = 'home form new history faq error'.split(/\s/)
    routes  = Object.extended()

    @views.each (page) -> routes[page] = page

    @routes = routes.merge('': 'root')

    @views.each (page) =>
      viewClass = window[page.camelize() + 'View']
      @::[page] = ->
        if @checkAccess(page)
          new viewClass(page: page)
        else
          @navigate('')

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
