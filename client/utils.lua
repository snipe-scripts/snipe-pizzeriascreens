AddEventHandler("playerDropped", function()
    ResetAll()
end)

function ResetAll()
    RemoveReplaceTexture("sm_pizzeria_txd_02", "pizzeria_menu")
    if duiObjpizzeriamenu then
        DestroyDui(duiObjpizzeriamenu)
    end
    RemoveReplaceTexture("sm_pizzeria_txd_02", "pizzeria_dinks")
    if duiObjpizzeriadrinks then
        DestroyDui(duiObjpizzeriadrinks)
    end
    RemoveReplaceTexture("sm_pizzeria_txd_01", "maldini-logo")
    if duiObjpizzerialogo then
        DestroyDui(duiObjpizzerialogo)
    end
    currentRoom = nil
    inPizzeria = false
    duiObjpizzeriamenu = nil
    duiObjpizzeriadrinks = nil
    duiObjpizzerialogo = nil
end

AddEventHandler('onResourceStop', function(resName)
    if resName == "snipe-pizzeriascreens" then
        RemoveReplaceTexture("sm_pizzeria_txd_02", "pizzeria_menu")
        if duiObjpizzeriamenu then
            DestroyDui(duiObjpizzeriamenu)
        end
        RemoveReplaceTexture("sm_pizzeria_txd_02", "pizzeria_dinks")
        if duiObjpizzeriadrinks then
            DestroyDui(duiObjpizzeriadrinks)
        end
        RemoveReplaceTexture("sm_pizzeria_txd_01", "maldini-logo")
        if duiObjpizzerialogo then
            DestroyDui(duiObjpizzerialogo)
        end
    end
end)