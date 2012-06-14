#= require_tree .

$ ->
  $(".scroll").click (event) ->
    event.preventDefault()
    $('html,body').animate(scrollTop: $(this.hash).offset().top, 500)
