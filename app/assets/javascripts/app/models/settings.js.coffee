class @Settings extends Backbone.Model

  wrapWithModernizr = (fn) ->
    -> fn.apply(@, arguments) if Modernizr.localstorage

  initialize: wrapWithModernizr ->
    @fetch()
    @on('change', => @save())

  fetch: wrapWithModernizr ->
    if settings = localStorage.getItem('settings')
      settings.keys().each (key) =>
        @set(key, settings[key], silent: true)

  save: ->
    localStorage.setItem('settings', @toJSON())
