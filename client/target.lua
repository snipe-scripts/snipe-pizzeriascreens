
--[[
Info regarding events - 

snipe-pizzeriascreens:client:OpenUIpizzeriamenu -> Opens the UI to change the image for the menu 
snipe-pizzeriascreens:client:OpenUIpizzeriadrinks -> Opens the UI to change the image for the drinks
snipe-pizzeriascreens:client:OpenUIpizzerialogo -> Opens the UI to change the image for the logo
snipe-pizzeriascreens:client:removeDUIpizzeriamenu -> Removes the image for the menu
snipe-pizzeriascreens:client:removeDUIpizzeriadrinks -> Removes the image for the drinks
snipe-pizzeriascreens:client:removeDUIpizzerialogo -> Removes the image for the logo

There's two options given, you can either use qb-target or bt-target (examples for both are given, comment whichever you dont want.)

If you are using custom target script, you can edit it to your liking by using the events given here.
]]--


-- qb-target
exports["qb-target"]:AddBoxZone("pizzeria_food_menu", vector3(814.27, -754.99, 26.78), 1.4, 1, {
    name="pizzeria_food_menu",
    heading=0,
    --debugPoly=true,
    minZ=27.58,
    maxZ=28.98
    },{
    options = {
        {
            event = "snipe-pizzeriascreens:client:OpenUIpizzeriamenu",
            icon = "fas fa-circle",
            label = "Change Image",
        },
        {
            event = "snipe-pizzeriascreens:client:removeDUIpizzeriamenu",
            icon = "fas fa-circle",
            label = "Remove Image",
        },
    },				
    distance = 2.5
})

exports["qb-target"]:AddBoxZone("pizzzeria_drinks", vector3(814.13, -751.12, 26.78), 1, 1, {
    name="pizzzeria_drinks",
    heading=0,
    --debugPoly=true,
    minZ=28.38,
    maxZ=29.78
    },{
    options = {
        {
            event = "snipe-pizzeriascreens:client:OpenUIpizzeriadrinks",
            icon = "fas fa-circle",
            label = "Change Image",
        },
        {
            event = "snipe-pizzeriascreens:client:removeDUIprizzeriadrinks",
            icon = "fas fa-circle",
            label = "Remove Image",
        },
    },				
    distance = 2.5
})

exports["qb-target"]:AddBoxZone("pizza_logo", vector3(813.68, -752.89, 26.78), 1.4, 0.4, {
    name="pizza_logo",
    heading=5,
    --debugPoly=true,
    minZ=28.13,
    maxZ=29.33
    },{
    options = {
        {
            event = "snipe-pizzeriascreens:client:OpenUIpizzerialogo",
            icon = "fas fa-circle",
            label = "Change Image",
        },
        {
            event = "snipe-pizzeriascreens:client:removeDUIpizzerialogo",
            icon = "fas fa-circle",
            label = "Remove Image",
        },
    },				
    distance = 2.5
})


-- For BT-target
--[[
    exports["bt-target"]:AddBoxZone("pizzeria_food_menu", vector3(814.27, -754.99, 26.78), 1.4, 1, {
    name="pizzeria_food_menu",
    heading=0,
    --debugPoly=true,
    minZ=27.58,
    maxZ=28.98
    },{
    options = {
        {
            event = "snipe-pizzeriascreens:client:OpenUIpizzeriamenu",
            icon = "fas fa-circle",
            label = "Change Image",
        },
        {
            event = "snipe-pizzeriascreens:client:removeDUIpizzeriamenu",
            icon = "fas fa-circle",
            label = "Remove Image",
        },
    },				
    distance = 2.5
})

exports["bt-target"]:AddBoxZone("pizzzeria_drinks", vector3(814.13, -751.12, 26.78), 1, 1, {
    name="pizzzeria_drinks",
    heading=0,
    --debugPoly=true,
    minZ=28.38,
    maxZ=29.78
    },{
    options = {
        {
            event = "snipe-pizzeriascreens:client:OpenUIpizzeriadrinks",
            icon = "fas fa-circle",
            label = "Change Image",
        },
        {
            event = "snipe-pizzeriascreens:client:removeDUIprizzeriadrinks",
            icon = "fas fa-circle",
            label = "Remove Image",
        },
    },				
    distance = 2.5
})

exports["bt-target"]:AddBoxZone("pizza_logo", vector3(813.68, -752.89, 26.78), 1.4, 0.4, {
    name="pizza_logo",
    heading=5,
    --debugPoly=true,
    minZ=28.13,
    maxZ=29.33
    },{
    options = {
        {
            event = "snipe-pizzeriascreens:client:OpenUIpizzerialogo",
            icon = "fas fa-circle",
            label = "Change Image",
        },
        {
            event = "snipe-pizzeriascreens:client:removeDUIpizzerialogo",
            icon = "fas fa-circle",
            label = "Remove Image",
        },
    },				
    distance = 2.5
})
]]--


