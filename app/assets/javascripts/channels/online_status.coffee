App.online_status = App.cable.subscriptions.create "OnlineStatusChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Connected to OnlineStatusChannel')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Disconnected from OnlineStatusChannel')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    current_user = data.user

    if current_user.online && $("span[id='user_#{current_user.id}'").length == 0
      $('#users_online').append("<span id='user_#{current_user.id}' > #{current_user.nickname} </span>")
    else if !current_user.online
      $("span[id='user_#{current_user.id}'").remove()
