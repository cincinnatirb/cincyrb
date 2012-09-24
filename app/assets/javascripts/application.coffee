#= require_tree ./models
#= require_tree ./templates
#= require_tree ./views
#= require main

$ ->
  $(".scroll").click (event) ->
    event.preventDefault()
    $('html,body').animate(scrollTop: $(this.hash).offset().top, 500)
