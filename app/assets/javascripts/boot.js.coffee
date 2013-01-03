@app = views: {}

Object.merge(Backbone.View::, RenderingExtension)

app.settings      = new App.Settings()
app.router        = new App.Router()
app.views.loading = new App.LoadingView()
app.user          = new App.User(id: 'current')

app.user.fetch

  success: ->
    Backbone.history.start()
    app.views.loading.hide()

  error: ->
    # TODO: Process error
