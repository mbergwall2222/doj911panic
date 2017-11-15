function sendToDiscord(name, message)
  if message == nil or message == '' then return FALSE end
  PerformHttpRequest('https://discordapp.com/api/webhooks/380363801633095681/7Axoyk7JX-i9n_sRIKZ9RPEzllDc6ICTXmMVXhIKh5ryMrD9oIKBQ6bJtgL9qSff8lYf', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('chatMessage', function(source, name, message)
  msg = string.lower( message )

  -- Check to see if a client typed in /dv
  if ( msg == "/911") then

      -- Cancel the chat message event (stop the server from posting the message)
      CancelEvent()

      -- Trigger the client event
      sendToDiscord('San Andreas Communications',name.." NEEDS EMERGENCY SERVICES (911)")
  end
end)

AddEventHandler('playerConnecting', function()
  sendToDiscord('SYSTEM', GetPlayerName(source) .. ' joined.')
end)

AddEventHandler('playerDropped', function(reason)
  sendToDiscord('SYSTEM', GetPlayerName(source) .. ' left (' .. reason .. ')')
end)
