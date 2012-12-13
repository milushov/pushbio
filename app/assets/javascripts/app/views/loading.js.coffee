class @LoadingView extends Backbone.View

  el: '@loading-view'

  hide: ->
    @$el.fadeOut(300)
