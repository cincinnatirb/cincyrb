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
    $('#next-meeting').html(@template( { meeting: @model.toJSON() }))
    @render_location()

  render_location: ->
    lon = @model.attributes.venue.lon
    lat = @model.attributes.venue.lat
    latlng =  new google.maps.LatLng(lat, lon)
    myOptions = {
      zoom: 8,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
      mapTypeControl: true }

    element = $("#location-map")[0]
    map = new google.maps.Map(element, myOptions)
    request =
        location: latlng
        radius: 50
        keyword: @model.attributes.venue.name
        address_components:
            street_address: @model.attributes.venue.address

    service = new google.maps.places.PlacesService(map)

    service.search(request, (results, status) =>
       if status == google.maps.places.PlacesServiceStatus.OK
         service.getDetails(reference: results[0].reference, (place, status) =>
           console.log(place)
           template = @location_template({ venue: @model.attributes.venue, place: place})
           $('#location-info').html(template)

           marker = new google.maps.Marker({
               position: place.geometry.location,
               map: map,
               title: @model.attributes.venue.name
               animation: google.maps.Animation.DROP,
               visible: true
           })

           infowindow = new google.maps.InfoWindow()
           infowindow.setContent(@location_template({ place: place, venue: @model.attributes.venue }))
           infowindow.setPosition(place.geometry.location)
           infowindow.open(map, marker)
           google.maps.event.addListener(marker, 'click', ->
             infowindow.open(map, marker)
           )
         )
    )
app.views.meetings = new MeetingsView
