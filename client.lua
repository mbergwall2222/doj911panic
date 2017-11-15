RegisterNetEvent( '911:getLocation' )

AddEventHandler( '911:getLocation', function(name)
  local playerPos = GetEntityCoords( GetPlayerPed( -1 ), true )
  local streetA, streetB = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, playerPos.x, playerPos.y, playerPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
  TriggerServerEvent("911:send911",name,streetA,streetB)
end)
