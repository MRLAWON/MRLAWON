-------------------------------------------------------------------------
------------------------------   Server    ------------------------------
-------------------------------------------------------------------------

local RSGCore = exports['rsg-core']:GetCoreObject()

BccUtils = exports["bcc-utils"].initiate()

BridgeDestroyed = false
RegisterServerEvent("lawson-bridges:ServerBridgeFallHandler", function(freshJoin)
        TriggerClientEvent("lawson-bridges:BridgeFall", -1) --triggers for all cleints
      end)
        Citizen.Wait(10000)	  

    if BridgeDestroyed then
      TriggerClientEvent("lawson-bridges:BridgeFall", _source) --triggers for loaded in client
	          Player.Functions.RemoveItem('weapon_thrown_dynamite', 1)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['weapon_thrown_dynamite'], "remove")
end


-------------------------------------------------------------------------
-------------------------------   End    --------------------------------
-------------------------------------------------------------------------
