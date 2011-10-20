class NextMeetingModel extends Backbone.Model
  url: '/next_meeting'
class NextMeetingView extends Backbone.View
  constructor: ->
    @el = $("next-meeting")
  render: ->
    view = @
    @el.html(JST['templates/meetings/next_meeting'](@model.toJSON))
