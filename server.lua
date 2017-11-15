RegisterServerEvent("911:send911")
function sendToAPI(name, street,cross)
  if message == nil or message == '' then return FALSE end
  PerformHttpRequest('https://dojrp-cad.com/api/1.1/wf/911', function(err, text, headers) end, 'POST', json.encode({callerName = name, street = street, cross = cross}), { ['Content-Type'] = 'application/json' , ['Authorization'] = 'Bearer 8309ca222a07ea4a41079c17a946add8'})
end

AddEventHandler('chatMessage', function(source, name, message)
  msg = string.lower( message )

  if ( msg == "/911") then

      CancelEvent()

      TriggerClientEvent('911:getLocation',source,name)
  end
end)

AddEventHandler('911:send911',function(source,name,street,cross)
  sendToAPI(name,street,cross)
end)
