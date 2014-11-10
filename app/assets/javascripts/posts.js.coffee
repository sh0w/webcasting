# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#blackboard').masonry()

$ ->

  $("a.add_form").on "ajax:success", (e, data, status, xhr) ->
    $(this).hide()
    $(this).prev().after(xhr.responseText)
    $('#blackboard').masonry()
  .on "ajax:error", (e, xhr, status, error) ->
    $(this).hide()
    $(this).prev().after(xhr.responseText)
    $('#blackboard').masonry()

  $("a.new_post").on "ajax:success", (e, data, status, xhr) ->
    $(this).hide()
    $(this).after(xhr.responseText)
    $('#blackboard').masonry()
  .on "ajax:error", (e, xhr, status, error) ->
    $(this).hide()
    $(this).after(xhr.responseText)
    $('#blackboard').masonry()

  $("a.edit_post").on "ajax:success", (e, data, status, xhr) ->
    $(this).hide()
    $(this).parent().find('.post-container').hide()
    $(this).after(xhr.responseText)
    $('#blackboard').masonry()
  .on "ajax:error", (e, xhr, status, error) ->
    $(this).hide()
    $(this).parent().find('.post-container').hide()
    $(this).after(xhr.responseText)
    $('#blackboard').masonry()
