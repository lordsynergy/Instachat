jQuery(document).on 'turbolinks:load', ->
  App.online_status.appear()

App.online_status = App.cable.subscriptions.create "OnlineStatusChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $('#online-users ul').remove()
    ulTag = document.createElement('ul')

    for nickname in data.users
      liTag = document.createElement('li')
      liTag.innerText = nickname
      ulTag.append(liTag)

      $('#online-users').append(ulTag)

    console.log(data)

  appear: ->
    @perform('appear')
