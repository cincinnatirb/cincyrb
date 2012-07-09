class MeetingsView extends Backbone.View
  tagName: "div"

  template: JST['templates/meetings/next_meeting']
  location_template: JST['templates/meetings/location']

  constructor: ->
    @model = app.models.meeting
    @venue = @model.attributes.venue

  render: ->
    date = new Date
    date.setTime(@model.get("time"))
    formatted_date = date.toDateString()
    @model.set(date: formatted_date)
    $('#next-meeting').html(@template(meeting: @model.toJSON()))
    $("#rsvp").attr("href", @model.get("event_url"))
    @tweet()
    @render_location()

  tweet: ->
    user = 'cincinnatirb'
    $.getJSON 'http://twitter.com/statuses/user_timeline.json?screen_name=' + user + '&count=4&callback=?', (data) ->
        tweet = data[0].text
        # process links and reply
        tweet = tweet.replace /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig, (url) ->
            "<a href='#{url}'>#{url}</a>"
        tweet = tweet.replace /B@([_a-z0-9]+)/ig, (reply) ->
            "#{reply.charAt(0)}<a href='http://twitter.com/#{reply.substring(1)}'>#{reply.substring(1)}</a>"
        $("#tweet p").html(tweet)
      
  render_location: ->
    @venue = @model.get('venue')
    $('#location-info').html(@location_template(venue: @venue))

app.views.meetings = new MeetingsView
