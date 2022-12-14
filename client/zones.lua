CreateThread(function ()
    local pizzeria = BoxZone:Create(vector3(804.11, -758.15, 26.78), 21.8, 21.6, {
        name="pizzeira",
        heading = 0,
        minZ = 25.78,
        maxZ = 29.78,
        -- debugPoly = true
    })
    pizzeria:onPlayerInOut(function(isPointInside)
        if isPointInside then
            inPizzeria = true
            GetDui()
        else
            inPizzeria = false
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
    end, 500)
end)


vector3(785.64, -758.24, 26.67)