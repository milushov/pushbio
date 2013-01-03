class App.User extends Backbone.Model

  urlRoot: '/users'

  loggedIn: ->
    @id? and @id != 'current'
