fx_version 'bodacious'
game 'gta5'
  
description 'mfp_banking | Native UI'
author 'MFPSCRIPTS'
version '2.1.1'
lua54 'yes'

escrow_ignore {
	'config.lua',
	'client.lua',
	'server.lua'
}  
  
client_scripts {
  '@NativeUI/NativeUI.lua', -- enable if you're using NativeUI
  --'@NativeUILua_Reloaded/src/NativeUIReloaded.lua', -- enable if you're using NativeUI Reloaded
  'config.lua',
  'client.lua'
}

server_scripts {
  --'@oxmysql/lib/MySQL.lua', -- enable if you're using oxmysql
  '@mysql-async/lib/MySQL.lua', -- enable if you're using mysql-async
  'config.lua',
  'server.lua',
  'server_encrypted.lua'
}

--shared_script '@es_extended/imports.lua' -- enable if you're using newest ESX version 

-- visit mfpscripts.com for more! --