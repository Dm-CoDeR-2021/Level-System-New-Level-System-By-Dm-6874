developer '^Dm#6874'

dependency 'essentialmode'

client_scripts {
	'@essentialmode/locale.lua',
	'client/client.lua'
}

server_scripts {
	'@essentialmode/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua'
}