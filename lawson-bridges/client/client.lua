-------------------------------------------------------------------------
------------------------------   Client    ------------------------------
-------------------------------------------------------------------------

local RSGCore = exports['rsg-core']:GetCoreObject()

VORPutils = {}
TriggerEvent("getUtils", function(utils)
  VORPutils = utils
end)

function loadTrainCars(trainHash)
    local trainWagons = Citizen.InvokeNative(0x635423d55ca84fc8, trainHash)
    for wagonIndex = 0, trainWagons - 1 do
      local trainWagonModel = Citizen.InvokeNative(0x8df5f6a19f99f0d5, trainHash, wagonIndex)
      while not HasModelLoaded(trainWagonModel) do
        Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
        Wait(100)
      end
    end
end

RegisterNetEvent("lawson-bridges:BridgeFall", function()
    local ran = 0
    repeat
        local object = GetRayfireMapObject(GetEntityCoords(PlayerPedId()), 10000.0, "des_trn3_bridge")
        SetStateOfRayfireMapObject(object, 4)
        Wait(100)
        AddExplosion(521.13, 1754.46, 187.65, 28, 1.0, true, false, true)
        AddExplosion(507.28, 1762.3, 187.77, 28, 1.0, true, false, true)
        AddExplosion(527.21, 1748.86, 187.8, 28, 1.0, true, false, true)
        Wait(100)
        SetStateOfRayfireMapObject(object, 6)
        ran = ran + 1
    until ran == 2 --has to run twice no idea why

    --Spawning ghost train model as the game engine wont allow trains to hit each other this will slow the trains down automatically if near the exploded part of the bridge
    Wait(1000)
    local trainHash = joaat("engine_config")
    loadTrainCars(trainHash)
    local ghostTrain = Citizen.InvokeNative(0xc239dbd9a57d2a71, trainHash, 499.69, 1768.78, 188.77, false, false, true, false)

    SetTrainSpeed(ghostTrain, 0.0)
    SetTrainCruiseSpeed(ghostTrain, 0.0) --these 2 natives freeze train on spawn
    SetEntityVisible(ghostTrain, false)
    SetEntityCollision(ghostTrain, false, false)
end)


CreateThread(function()
    if Config.BacchusBridgeDestroying.enabled then
        local PromptGroup = VORPutils.Prompts:SetupPromptGroup()
        local firstprompt = PromptGroup:RegisterPrompt(_U("BlowUpBridge"), Config.Key, 1, 1, true, "hold",
            { timedeventhash = "MEDIUM_TIMED_EVENT" })
        while true do
            local sleep = true
            local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
            if GetDistanceBetweenCoords(px, py, pz, Config.BacchusBridgeDestroying.coords.x, Config.BacchusBridgeDestroying.coords.y, Config.BacchusBridgeDestroying.coords.z, true) < 2 then
                sleep = false
                PromptGroup:ShowGroup("")
                if firstprompt:HasCompleted() then
                    TriggerServerEvent("lawson-bridges:ServerBridgeFallHandler", false)
                end
            end

            if sleep then
                Wait(1500)
            end
            Wait(5)
        end
    end
end)

-------------------------------------------------------------------------
-------------------------------   End    --------------------------------
-------------------------------------------------------------------------
