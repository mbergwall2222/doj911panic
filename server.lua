function sendToAPI(name, message)
  if message == nil or message == '' then return FALSE end
  PerformHttpRequest('http://mbergwall.io/cad/911.php', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('chatMessage', function(source, name, message)
  msg = string.lower( message )

  if ( msg == "/911") then

      CancelEvent()

      sendToAPI(name,"911")
  end
end)
