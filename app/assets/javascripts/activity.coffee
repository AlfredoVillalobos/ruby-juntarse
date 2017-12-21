# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  $("body").on "click", "#link-send-invitation", (e) ->
    users_sender = [];
    content = $('.content').val()    
    $('.user-selected-box').each ->
      users_sender.push parseInt($(this).data("user"))
      return
    if users_sender.length == 0
      alert 'Debe haber seleccionado algún deportista'
    else
      $.ajax
        type: 'POST'
        url: '/invitations'
        data:
          users: users_sender
          content: content
          sport: $('#product-modal').data("sport")
        dataType: 'script'
        success: (z) ->
        $('.user-selected-box').each ->
          App.activity.send_event $(this).data('user')
          return
        $('.modal').remove()
        $('.modal-backdrop').remove()
    return
