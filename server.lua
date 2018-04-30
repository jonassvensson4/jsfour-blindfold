local ESX = nil

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Sätt på/ta av ögonbindel
RegisterServerEvent('jsfour-blindfold')
AddEventHandler('jsfour-blindfold', function( player, hasItem )
  local src = source
  TriggerClientEvent('jsfour-blindfold', player, hasItem, src)
end)

-- Notis skickas om spelaren inte har en ögonbindel
RegisterServerEvent('jsfour-blindfold:notis')
AddEventHandler('jsfour-blindfold:notis', function( src )
  ESX.ShowNotification('Du har ingen ögonbindel på dig..', src)
end)

-- Ger spelaren en ögonbindel
RegisterServerEvent('jsfour-blindfold:giveItem')
AddEventHandler('jsfour-blindfold:giveItem', function( src )
  local xPlayer = ESX.GetPlayerFromId(src)
  xPlayer.addInventoryItem('blindfold', 1)
end)

-- Kollar om spelaren har en ögonbindel
ESX.RegisterServerCallback('jsfour-blindfold:itemCheck', function( src, cb )
  local xPlayer = ESX.GetPlayerFromId(src)
  local item    = xPlayer.getInventoryItem('blindfold').count
  if item > 0 then
    cb(true)
    xPlayer.removeInventoryItem('blindfold', 1)
  else
    cb(false)
  end
end)
