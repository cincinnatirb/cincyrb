$(function() {
  prettyPrint();

	$("#nav-bar a").click( function(event){
    let y;
    const target = $($(this).attr('href'));
    const viewport = $(window);
    if (target.height > viewport.height) {
      y = target.offset().top - 130;
    } else {
      y = target.offset().top(+(target.height() / 2) - (viewport.hight() / 2) - 60);
    }

    $('body, html').stop().animate({ scrollTop: y }, 1000);
    return event.preventDefault();
  });

	return $("#contact-form")
		.bind( "ajax:before", function(evt, xhr, settings) {
			$('[type="submit"]').attr('disabled','disabled');
			return $(".flash_notice").text("Submitting your comment. Please wait...");
		})
		.bind("ajax:success", function(evt, data, status, xhr) {
			$('[type="submit"]').removeAttr('disabled');
			$(".flash_notice").html(data.message);
			if (data.success) {
				return $("#contact-form")[0].reset();
		}
		})
		.bind("ajax:error", function(evt, xhr, status) {
			$('[type="submit"]').removeAttr('disabled');
			if (xhr.status === 422) {
				const {
                  errors
                } = $.parseJSON(xhr.responseText);
				return $(".flash_notice").text(errors);
			} else {
				return $(".flash_notice").text("A server error occurred while processing your request. Please wait a moment and try again.");
		}
		});
});
