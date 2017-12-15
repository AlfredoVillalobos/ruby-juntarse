App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $('#messages').append data['message']

  speak: (message) ->
    @perform 'speak', message: message, id: "<%= current_user.id %>"

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    console.log("hola")
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
