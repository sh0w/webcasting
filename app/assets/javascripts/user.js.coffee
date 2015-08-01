# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
 $('#messages').animate({ scrollTop: $(document).height() }, 0) if $("#messages").length > 0

 $("a.show_msg").on("ajax:success", (e, data, status, xhr) ->
   $('.show_msg').removeClass('active')
   $(this).child('small').removeClass('unread')
   $(this).addClass('active')
   $('#messages > .message-container').html(xhr.responseText)

  ).on "ajax:error", (e, xhr, status, error) ->
   $('.show_msg').removeClass('active')
   $(this).children('small').removeClass('unread')
   $(this).addClass('active')
   $('#messages > .message-container').html(xhr.responseText)
   $('#messages').animate({ scrollTop: $(document).height() }, 0)

 $("a.ps-prev").on("ajax:success", (e, data, status, xhr) ->
   $('#ps-container').parent().html(xhr.responseText)
 ).on "ajax:error", (e, xhr, status, error) ->
   $('#ps-container').parent().html(xhr.responseText)

 $('#grid').masonry()
 Slider.init() if $(".ps-prev").length > 0