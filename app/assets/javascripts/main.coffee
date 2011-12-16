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
  $("#nav-bar a").click( (event)->
    target = $($(this).attr('href'))
    viewport = $(window)
    if target.height > viewport.height
      y = target.offset().top - 130
    else
      y = target.offset().top +(target.height() / 2) - (viewport.hight() / 2) - 60

    $('body, html').stop().animate({ scrollTop: y }, 1000)
    event.preventDefault()
  )
