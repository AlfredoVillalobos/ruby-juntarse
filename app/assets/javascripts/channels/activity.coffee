App.activity = App.cable.subscriptions.create "ActivityChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
 
  disconnected: ->
    # Called when the subscription has been terminated by the server
 
  received: (data) ->
    active_chatroom = $("[data-user-id='#{data.user_id}']")
    if active_chatroom.length > 0
      $("[data-user-id='#{data.user_id}']").html(data.events)

  send_event: (user) ->
    @perform "send_event", {user: user}
