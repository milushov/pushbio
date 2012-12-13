@RenderingExtension =

  renderHTML: (name, obj = {}) ->
    JST['app/templates/' + name](obj)

  render: ->
    $ @renderHTML.apply(@, arguments)
