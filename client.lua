ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_andreas")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
	end
	for k,v in pairs(ConfigShops.PedShops) do
	ped = CreatePed("PED_TYPE_CIVMALE", "cs_andreas", v.x, v.y, v.z, v.a, heading, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
	end
end)

RMenu.Add('shop', 'main', RageUI.CreateMenu("Supérette", "Menu Boutique"))
RMenu.Add('shop', 'boisson', RageUI.CreateSubMenu(RMenu:Get('shop', 'main'), "Boisson", "Menu Boisson"))
RMenu.Add('shop', 'nourritures', RageUI.CreateSubMenu(RMenu:Get('shop', 'main'), "Nourritures", "Menu Nourritures"))
RMenu.Add('shop', 'fermer', RageUI.CreateSubMenu(RMenu:Get('shop', 'main'), "Fermer", "Menu Fermeture"))

Citizen.CreateThread(function()
    while true do
            RageUI.IsVisible(RMenu:Get('shop', 'main'), true, true, true, function()
                
            RageUI.Separator("↓~b~Boisson~w~↓")

            RageUI.ButtonWithStyle("~r~Menu Boissons", nil, {RightLabel = "→→"},true, function() 
            end, RMenu:Get('shop', 'boisson'))

            RageUI.Separator("↓~g~Nourritures~w~↓")

            RageUI.ButtonWithStyle("~r~Menu Nourritures", nil, {RightLabel = "→→"},true, function() 
            end, RMenu:Get('shop', 'nourritures'))

            


        end, function()
        end)

        
        RageUI.IsVisible(RMenu:Get('shop', 'nourritures'), true, true, true, function()

        RageUI.ButtonWithStyle("Pain", "Voici du pain frais", {RightLabel = "~g~36$"}, true, function(Hovered, Active, Selected)
            if Selected then
                TriggerServerEvent('Banban:buyitem', "bread", --[[prix]]16)
            end
        end)

    end, function()
    end)
        RageUI.IsVisible(RMenu:Get('shop', 'boisson'), true, true, true, function()

            RageUI.ButtonWithStyle("Eau", "Voici du pain frais", {RightLabel = "~g~3$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('Banban:buyitem', "water", 1)
                end
            end)


    end, function()
    end)

        Citizen.Wait(0)
    end
end) 

Citizen.CreateThread(function()
    while true do
        local interval = 250
        for k,v in pairs (ConfigShops.MenuShops) do
            local playerPos = GetEntityCoords(PlayerPedId())
            local distance = #(playerPos - v)
            if distance <= 9 then
                interval = 0
                DrawMarker(22, v.x, v.y, v.z+0.98, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255--[[rouge]], 0--[[vert]], 0--[[bleu]], 150, 55555, false, true, 2, false, false, false, false)
                if distance <= 1.5 then
                    RageUI.Text({ message = "Appuyez sur ~b~[E]~w~ pour Accéder au magasin", time_display = 1 })
                    if IsControlJustPressed(0, 51) then
                        canInteract = false
                        RageUI.Visible(RMenu:Get('shop', 'main'), not RageUI.Visible(RMenu:Get('shop', 'main')))
                    end
                end
            end
        end
        Wait(interval)
    end
end)


