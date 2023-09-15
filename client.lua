function SpawnInformant(model, position, heading)
    local modelHash = GetHashKey(model)

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end

    local ped = CreatePed(5, modelHash, position.x, position.y, position.z, heading, false, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    return ped
end

function openMenu()
    local main = RageUI.CreateMenu('Informant', 'Informant')
    RageUI.Visible(main, not RageUI.Visible(main))
    
    while main do
        Wait(0)
        
        RageUI.IsVisible(main, true, true, true, function()
            for _, info in pairs(Config.Information) do
                RageUI.ButtonWithStyle(info.name, nil, {
                    RightLabel = "$" .. info.price .. ""
                }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        ESX.TriggerServerCallback('CheckMoney', function(hasMoney)
                            if hasMoney then
                                CLNotify("You paid $" .. info.price .. " ")
                                Timeout(Config.timeoutDuration)
                            else
                                CLNotify("You don't have enough money")
                            end
                        end, info.price)
                    end
                end)
            end
        end, function()
        end)
        
        if not RageUI.Visible(main) then
            main = RMenu:DeleteType(main, true)
        end
    end
end

CreateThread(function()
    for _, v in pairs(Config.Informants) do
        local ped = SpawnInformant(v.model, v.position, v.heading)
    end

    while true do
        local sleep = 500
        local playerCoords = GetEntityCoords(PlayerPedId())

        for _, v in pairs(Config.Informants) do
            local position = v.position
            local distance = #(vector3(playerCoords.x, playerCoords.y, playerCoords.z) - vector3(position.x, position.y, position.z))

            if distance <= 3.0 then
                sleep = 1
                ShowHelpNotification("~INPUT_CONTEXT~")
                if IsControlJustPressed(1, 38) then
                    openMenu()
                end
            end
        end
        Wait(sleep)
    end
end)
