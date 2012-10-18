@Boot =

  start: ->

    # Apply extensions
    Object.merge(Backbone.View::, RenderingExtension)

    # Read settings
    @settings = new Settings(store.get('settings'))

    # Create router
    @router = new Router()

    # Create and fetch current user
    @currentUser = new User(id: 'current')
    @currentUser.fetch
      success: ->
        Backbone.history.start()

      error: ->
        # TODO: Process error
        #alert 'Something wrong!'
