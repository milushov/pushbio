class @PageView extends Backbone.View

  constructor: ->
    super
    @show()

  show: ->
    @render()
    @$el.fadeIn(300)

  render: ->
    super(@page(), {}).appendTo('@content')

  page: ->
    @options.page
