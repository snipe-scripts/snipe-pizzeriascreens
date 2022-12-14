local ScreenInfo = {}

RegisterServerEvent("snipe-pizzeriascreens:server:synctextures")
AddEventHandler("snipe-pizzeriascreens:server:synctextures", function(room, url, width, height)
    local source = source
    local info = {}
    info.url = url
    info.width = width
    info.height = height
    ScreenInfo[room] = info
    TriggerClientEvent("snipe-pizzeriascreens:client:synctextures", -1, room, url, width, height)
end)

RegisterServerEvent("snipe-pizzeriascreens:server:removeTextures")
AddEventHandler("snipe-pizzeriascreens:server:removeTextures", function(room)
    ScreenInfo[room] = nil
    TriggerClientEvent("snipe-pizzeriascreens:client:removeTextures", -1, room)
end)

RegisterServerEvent("snipe-pizzeriascreens:server:triggerActiveTexture")
AddEventHandler("snipe-pizzeriascreens:server:triggerActiveTexture", function()
    local source = source
    for k, v in pairs(ScreenInfo) do
        TriggerClientEvent("snipe-pizzeriascreens:client:synctextures",source, k ,v.url, v.width, v.height)
    end
end)