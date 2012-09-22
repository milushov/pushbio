#= require_tree ./extensions
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require ./router
#= require_self

# Apply extensions
Object.merge(Backbone.View::, RenderingExtension)

# Create router
@router = new Router()

# Create and fetch current user
@currentUser = new User(id: 'current')
@currentUser.fetch
  success: ->
    Backbone.history.start()

  error: ->
    # TODO: Process error
    alert 'Something wrong!'
