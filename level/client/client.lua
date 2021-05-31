DM                 = nil
Citizen.CreateThread(function()
	while DM == nil do
	TriggerEvent('esx:getSharedObject', function(obj) DM = obj end)
		Citizen.Wait(1)
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(900000)
		TriggerServerEvent('SCRIPT:ADDRESPECT')
	end
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	TriggerServerEvent('SCRIPT:SHOWLEVEL')
end)
local lvl = '0'
RegisterNetEvent('SCRIPT:LEVEL')
AddEventHandler('SCRIPT:LEVEL', function(levelesh)
	lvl = levelesh
end)
local res = '0'
RegisterNetEvent('SCRIPT:RESPECT')
AddEventHandler('SCRIPT:RESPECT', function(respesh)
	res = respesh
end)
Citizen.CreateThread( function()
	while true do
		Wait(1)
		SetTextFont(8)
		SetTextProportional(1)
		SetTextScale(0.25, 0.25)
		SetTextColour( 32, 241, 245, 255 )
		SetTextDropShadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString('Level : ' .. lvl)
		DrawText(0.93, 0.10)
	end
end)
Citizen.CreateThread( function()
	while true do
		Wait(1)
		SetTextFont(8)
		SetTextProportional(1)
		SetTextScale(0.25, 0.25)
		SetTextColour( 32, 241, 245, 255 ) 
		SetTextDropShadow(0, 0, 0, 0, 255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString('Respect : ' .. res)
		DrawText(0.93, 0.12)
	end
end)
