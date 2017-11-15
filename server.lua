function sendToDiscord(name, message)
  if message == nil or message == '' then return FALSE end
  PerformHttpRequest('DISCORD_URL', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('playerActivated', function()
  sendToDiscord('SYSTEM', GetPlayerName(source) .. ' joined.')
end)

AddEventHandler('playerDropped', function(reason)
  sendToDiscord('SYSTEM', GetPlayerName(source) .. ' left (' .. reason .. ')')
end)
