@RenderingExtension =

  renderHTML: (name, obj = {}) ->
    JST['templates/' + name](obj)

  render: ->
    $ @renderHTML.apply(@, arguments)