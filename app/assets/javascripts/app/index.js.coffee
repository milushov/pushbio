#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require ./router
#= require_self

->
  new Router()
  Backbone.history.start()
