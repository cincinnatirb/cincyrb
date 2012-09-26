#= require main
#= require_tree ./models
#= require_tree ./templates
#= require_tree ./views

$ ->
  $(".scroll").click (event) ->
    event.preventDefault()
    $('html,body').animate(scrollTop: $(this.hash).offset().top, 500)
