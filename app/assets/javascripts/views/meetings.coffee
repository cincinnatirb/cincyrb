class MeetingsView extends Backbone.View
  tagName: "div"

  template: JST['templates/meetings/next_meeting']

  constructor: ->
    @model = app.models.meeting

  render: ->
    $('#next-meeting').html(@template( { meeting: @model.toJSON() }))

app.views.meetings = new MeetingsView
