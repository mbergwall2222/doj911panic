RegisterServerEvent("911:send911")
function sendToAPI(name, street,cross)
  PerformHttpRequest('https://dojrp-cad.com/api/1.1/wf/911', function(err, text, headers) end, 'POST', json.encode({callerName = name, street = street, cross = cross}), { ['Content-Type'] = 'application/json' , ['Authorization'] = 'Bearer 8309ca222a07ea4a41079c17a946add8'})
  print("sent")
end

AddEventHandler('chatMessage', function(source, name, message)
  msg = string.lower( message )

  if ( msg == "/911") then
      print("911 received")
      CancelEvent()

      TriggerClientEvent('911:getLocation',source,name)
  end
end)

AddEventHandler('911:send911',function(source,name,street,cross)
  print("sending 911 call")
  sendToAPI(name,street,cross)
end)
