@Boot =

  start: ->

    # Apply extensions
    Object.merge(Backbone.View::, RenderingExtension)

    # Read settings
    window.settings = new Settings()

    # Create router
    window.router = new Router()

    # Create and fetch current user
    window.currentUser = new User(id: 'current')
    currentUser.fetch
      success: ->
        Backbone.history.start()

      error: ->
        # TODO: Process error
        #alert 'Something wrong!'
