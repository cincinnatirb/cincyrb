class MeetingsView extends Backbone.View
  constructor: ->
    @el = $("next-meeting")
  render: ->
    @el.html(JST['templates/meetings/next_meeting'](@model.toJSON()))
