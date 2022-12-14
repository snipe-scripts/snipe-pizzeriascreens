currentRoom = nil
inPizzeria = false
duiObjpizzeriamenu = nil
duiObjpizzeriadrinks = nil
duiObjpizzerialogo = nil

RegisterNetEvent("snipe-pizzeriascreens:client:OpenUI")
AddEventHandler("snipe-pizzeriascreens:client:OpenUI", function(room)
    currentRoom = room
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('CloseDocument', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('Invalid', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('PrintDocument', function(data)
    SetNuiFocus(false, false)
    local url = data.url
    local width = data.width
    local height = data.height

    if Config.RestrictMode then
        local match = false 
        for k, v in pairs(Config.AllowedChannels) do 
            if string.find(data.url, v) ~= nil then
                match = true
                break
            end 
        end
        if not match then
            return
        end
    end

    if currentRoom == "pizzeria" then
        RemoveReplaceTexture("sm_pizzeria_txd_02", "pizzeria_menu")
        if duiObjpizzeriamenu then
            DestroyDui(duiObjpizzeriamenu)
        end
    elseif currentRoom == "pizzeriadrinks" then
        RemoveReplaceTexture("sm_pizzeria_txd_02", "pizzeria_dinks")
        if duiObjpizzeriadrinks then
            DestroyDui(duiObjpizzeriadrinks)
        end
    elseif currentRoom == "pizzerialogo" then
        RemoveReplaceTexture("sm_pizzeria_txd_01", "maldini-logo")
        if duiObjpizzerialogo then
            DestroyDui(duiObjpizzerialogo)
        end
    end
    TriggerServerEvent("snipe-pizzeriascreens:server:synctextures", currentRoom, url, width, height)
end)

RegisterNetEvent("snipe-pizzeriascreens:client:synctextures")
AddEventHandler("snipe-pizzeriascreens:client:synctextures", function(room, url, width, height)
    if room == "pizzeria" and inPizzeria then
        local txd = CreateRuntimeTxd('pizzeria_menu_txd')
        duiObjpizzeriamenu = CreateDui(url, width, height)
        local dui = GetDuiHandle(duiObjpizzeriamenu)
        local tx = CreateRuntimeTextureFromDuiHandle(txd, "doc_png", dui)
        AddReplaceTexture('sm_pizzeria_txd_02', 'pizzeria_menu', 'pizzeria_menu_txd', "doc_png")
    elseif room == "pizzeriadrinks" and inPizzeria then
        local txd = CreateRuntimeTxd('pizzeria_drinks_txd')
        duiObjpizzeriadrinks = CreateDui(url, width, height)
        local dui = GetDuiHandle(duiObjpizzeriadrinks)
        local tx = CreateRuntimeTextureFromDuiHandle(txd, "doc_png", dui)
        AddReplaceTexture('sm_pizzeria_txd_02', 'pizzeria_dinks', 'pizzeria_drinks_txd', "doc_png")
    elseif room == "pizzerialogo" and inPizzeria then
        local txd = CreateRuntimeTxd('pizzeria_logo_txd')
        duiObjpizzerialogo = CreateDui(url, width, height)
        local dui = GetDuiHandle(duiObjpizzerialogo)
        local tx = CreateRuntimeTextureFromDuiHandle(txd, "doc_png", dui)
        AddReplaceTexture('sm_pizzeria_txd_01', 'maldini-logo', 'pizzeria_logo_txd', "doc_png")
    end
end)


RegisterNetEvent("snipe-pizzeriascreens:client:removeDUI")
AddEventHandler("snipe-pizzeriascreens:client:removeDUI", function(room)
    TriggerServerEvent("snipe-pizzeriascreens:server:removeTextures", room)
end)

RegisterNetEvent("snipe-pizzeriascreens:client:removeTextures")
AddEventHandler("snipe-pizzeriascreens:client:removeTextures", function(room)
    DestroySpawnedDui(room)
end)

function DestroySpawnedDui(room)
    if room == "pizzeria" then
        if duiObjpizzeriamenu then
            DestroyDui(duiObjpizzeriamenu)
            duiObjpizzeriamenu = nil
            RemoveReplaceTexture("sm_pizzeria_txd_02", "pizzeria_menu")
        end
    elseif room == "pizzeriadrinks" then
        if duiObjpizzeriadrinks then
            DestroyDui(duiObjpizzeriadrinks)
            duiObjpizzeriadrinks = nil
            RemoveReplaceTexture("sm_pizzeria_txd_02", "pizzeria_dinks")
        end
    elseif room == "pizzerialogo" then
        if duiObjpizzerialogo then
            DestroyDui(duiObjpizzerialogo)
            duiObjpizzerialogo = nil
            RemoveReplaceTexture("sm_pizzeria_txd_01", "maldini-logo")
        end
    end
end

function GetDui()
    TriggerServerEvent("snipe-pizzeriascreens:server:triggerActiveTexture")
end

-- events for bt-target

RegisterNetEvent("snipe-pizzeriascreens:client:OpenUIpizzeriamenu")
AddEventHandler("snipe-pizzeriascreens:client:OpenUIpizzeriamenu", function()
    currentRoom = "pizzeria"
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent("snipe-pizzeriascreens:client:OpenUIpizzeriadrinks")
AddEventHandler("snipe-pizzeriascreens:client:OpenUIpizzeriadrinks", function()
    currentRoom = "pizzeriadrinks"
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent("snipe-pizzeriascreens:client:OpenUIpizzerialogo")
AddEventHandler("snipe-pizzeriascreens:client:OpenUIpizzerialogo", function()
    currentRoom = "pizzerialogo"
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent("snipe-pizzeriascreens:client:removeDUIpizzeriamenu")
AddEventHandler("snipe-pizzeriascreens:client:removeDUIpizzeriamenu", function()
    TriggerServerEvent("snipe-pizzeriascreens:server:removeTextures", "pizzeria")
end)

RegisterNetEvent("snipe-pizzeriascreens:client:removeDUIprizzeriadrinks")
AddEventHandler("snipe-pizzeriascreens:client:removeDUIprizzeriadrinks", function()
    TriggerServerEvent("snipe-pizzeriascreens:server:removeTextures", "pizzeriadrinks")
end)

RegisterNetEvent("snipe-pizzeriascreens:client:removeDUIpizzerialogo")
AddEventHandler("snipe-pizzeriascreens:client:removeDUIpizzerialogo", function()
    TriggerServerEvent("snipe-pizzeriascreens:server:removeTextures", "pizzerialogo")
end)