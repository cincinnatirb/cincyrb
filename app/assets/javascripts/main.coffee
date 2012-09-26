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
 	$("#contact-form")
		.bind( "ajax:before", (evt, xhr, settings) ->
			$('[type="submit"]').attr('disabled','disabled')
			$(".flash_notice").text("Submitting your comment. Please wait...")
		)
		.bind("ajax:success", (evt, data, status, xhr) ->
			$('[type="submit"]').removeAttr('disabled')
			$(".flash_notice").html(data.message)
			if data.success 
				$("#contact-form")[0].reset()
		)
		.bind("ajax:error", (evt, xhr, status) ->
			$('[type="submit"]').removeAttr('disabled')
			errors = $.parseJSON(xhr.responseText).errors
			$(".flash_notice").text(errors)
		)
