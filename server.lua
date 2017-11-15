function sendToAPI(name, message)
  if message == nil or message == '' then return FALSE end
  PerformHttpRequest('http://mbergwall.io/cad/911.php', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('chatMessage', function(source, name, message)
  msg = string.lower( message )

  -- Check to see if a client typed in /dv
  if ( msg == "/911") then

      -- Cancel the chat message event (stop the server from posting the message)
      CancelEvent()

      -- Trigger the client event
      sendToAPI(name,"911")
  end
end)
