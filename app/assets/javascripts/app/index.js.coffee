#= require_tree ./extensions
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require ./router
#= require_self

->
  # Apply extensions
  Object.merge(Backbone.View::, RenderingExtension)

  new Router()
  Backbone.history.start()
