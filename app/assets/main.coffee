window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}

$('document').ready ->
    inititalize: ->
      app.views.meetings = new MeetingsView
      Backbone.history.navigate('meeting', false) if Backbone.history.getFragment() is ''
  app.inititalize()
  Backbone.history.start()

