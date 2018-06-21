App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    document.getElementById('messages').innerHTML += data['message']

  speak: (message) ->
    @perform 'speak', message: message


document.addEventListener 'keypress',  (event) ->
  if event.keyCode is 13 # return/enter = send
    if event.srcElement.getAttribute('data-behavior') is 'room_speaker'
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
