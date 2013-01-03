class App.PageView extends Backbone.View

  constructor: ->
    super
    @show()

  show: ->
    @render(@view()).appendTo('@content')
    @$el.fadeIn(300)

  view: ->
    @options.page
