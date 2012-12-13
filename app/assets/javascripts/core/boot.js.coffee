@Boot =

  start: ->

    # Apply extensions
    Object.merge(Backbone.View::, RenderingExtension)

    # Read settings
    window.settings = new Settings()

    # Create router
    window.router = new Router()

    # Create loading view
    loadingView = new LoadingView()

    # Create and fetch current user
    window.currentUser = new User(id: 'current')
    currentUser.fetch
      success: ->
        Backbone.history.start()
        loadingView.hide()

      error: ->
        # TODO: Process error
        #alert 'Something wrong!'
