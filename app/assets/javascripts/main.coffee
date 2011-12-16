window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}


app.initialize = ->
  app.models.meeting.fetch(success: -> app.views.meetings.render())

$ ->
  prettyPrint()
  app.initialize()

