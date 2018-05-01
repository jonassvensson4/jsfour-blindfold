local ESX  = nil
local open = false

-- ESX
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Öppnar/stänger ögonbindel
RegisterNetEvent('jsfour-blindfold')
AddEventHandler('jsfour-blindfold', function( hasItem, src )
	if not open and hasItem then
		TriggerEvent('skinchanger:getSkin', function(skin)
			local clothesSkin = {
				['mask_1'] = 54, ['mask_2'] = 0
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end)
		open = true
		SendNUIMessage({
			action = "open"
		})
	elseif open then
		TriggerEvent('skinchanger:getSkin', function(skin)
			local clothesSkin = {
				['mask_1'] = 0, ['mask_2'] = 0
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end)
		open = false
		SendNUIMessage({
			action = "close"
		})
		TriggerServerEvent('jsfour-blindfold:giveItem', src)
	else
		TriggerServerEvent('jsfour-blindfold:notis', src)
	end
end)
