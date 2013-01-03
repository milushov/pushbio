class App.Settings extends Backbone.Model

  STORAGE_KEY = 'settings'

  wrapWithModernizr = (fn) ->
    ->
      if Modernizr.localstorage
        fn.apply(@, arguments)

  initialize: wrapWithModernizr ->
    @fetch()
    @listenTo(@, 'change', @save)

  fetch: wrapWithModernizr ->
    if data = @data()
      data.keys().each (key) =>
        @set(key, data[key], silent: true)

  data: ->
    json = localStorage.getItem(STORAGE_KEY)
    try
      data = JSON.parse(json)
      Object.extended(data)
    catch e
      # TODO: Setup echoes
      console.error e

  save: ->
    localStorage.setItem(STORAGE_KEY, @toJSON())
