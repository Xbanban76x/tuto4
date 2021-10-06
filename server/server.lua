ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('Banban:buyitem')
AddEventHandler('Banban:buyitem', function(Item, Prix)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local price = Prix
    local xMoney = xPlayer.getMoney()
    if xMoney >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(Item, 1)
        TriggerClientEvent('esx:showNotification', _src, "~g~Achats~w~ effectué !")
    else
        TriggerClientEvent('esx:showNotification', _src, "Vous n'avez assez ~r~d\'argent")
    end
end)
