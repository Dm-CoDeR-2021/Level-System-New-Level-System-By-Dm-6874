DM = nil
TriggerEvent('esx:getSharedObject', function(obj) DM = obj end)

RegisterServerEvent('SCRIPT:ADDRESPECT')
AddEventHandler('SCRIPT:ADDRESPECT', function()
	local source = source
	local xPlayer = DM.GetPlayerFromId(source)
	MySQL.Async.fetchAll("SELECT respect FROM users WHERE identifier=@identifier",{
        ['@identifier'] = GetPlayerIdentifiers(source)[1],
    },function(result)
		local res = result[1].respect + 1
		TriggerClientEvent('SCRIPT:RESPECT',source,result[1].respect)
		MySQL.Async.execute('UPDATE users SET respect='..res..' WHERE identifier=@identifier',
		{
			['@identifier'] = GetPlayerIdentifiers(source)[1],
		})
		MySQL.Async.fetchAll("SELECT lvl FROM users WHERE identifier=@identifier",{
			['@identifier'] = GetPlayerIdentifiers(source)[1],
		},
		function(result)
			local lvl = result[1].lvl
			local lvl1 = lvl + 1
			local money = lvl1*10000
			if lvl < res then
				TriggerClientEvent('SCRIPT:LEVEL',source,lvl1)
				TriggerClientEvent('SCRIPT:RESPECT',source,0)
				TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, 'Tabrik Shoma Level Up Shodid Va Mablagh ^2'..money..' ^0Jayeze Gereftid')
				TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, 'Level Jadid Shoma : ^2'..lvl1)
				MySQL.Async.execute('UPDATE users SET respect=0 WHERE identifier=@identifier',
				{
					['@identifier'] = GetPlayerIdentifiers(source)[1],
				})
				MySQL.Async.execute('UPDATE users SET lvl=' .. lvl1 .. ' WHERE identifier=@identifier',
				{
					['@identifier'] = GetPlayerIdentifiers(source)[1],
				})
				xPlayer.addMoney(money)
			end
		end)
    end)
end)

RegisterServerEvent('SCRIPT:SHOWLEVEL')
AddEventHandler('SCRIPT:SHOWLEVEL', function()
	local source = source
	MySQL.Async.fetchAll("SELECT lvl FROM users WHERE identifier=@identifier",{
		['@identifier'] = GetPlayerIdentifiers(source)[1],
	},
	function(result)
		TriggerClientEvent('SCRIPT:LEVEL',source,result[1].lvl)
	end)
	MySQL.Async.fetchAll("SELECT respect FROM users WHERE identifier=@identifier",{
		['@identifier'] = GetPlayerIdentifiers(source)[1],
	},
	function(result)
		TriggerClientEvent('SCRIPT:RESPECT',source,result[1].respect)
	end)
end)
