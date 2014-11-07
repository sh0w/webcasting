# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#userlist').masonry()

$ ->

 $("a.show_msg").on("ajax:success", (e, data, status, xhr) ->
   $('.show_msg').removeClass('active')
   $(this).addClass('active')
   $('#messages').html(xhr.responseText)
  ).on "ajax:error", (e, xhr, status, error) ->
   $('.show_msg').removeClass('active')
   $(this).addClass('active')
   $('#messages').html(xhr.responseText)