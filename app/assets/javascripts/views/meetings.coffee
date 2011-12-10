class MeetingsView extends Backbone.View
  tagName: "div"

  template: JST['templates/meetings/next_meeting']

  constructor: ->
    @model = app.models.meeting

  render: ->
    $('#next-meeting').html(@template( { meeting: @model.toJSON() }))
    #@location_template = JST['templates/meetings/location']()
    #$('#location-details').html(@location_template)
    @render_location()

  render_location: ->
    latlng = new google.maps.LatLng(@model.attributes.venue.lat, @model.attributes.venue.lon)
    myOptions =
      zoom: 8
      center: latlng
      mapTypeid: google.maps.MapTypeId.ROADMAP
    myOptions.setValues (key, value) ->
      @myOptions[key] = value
    google.maps.Map($("#location-directions"), myOptions)

app.views.meetings = new MeetingsView
