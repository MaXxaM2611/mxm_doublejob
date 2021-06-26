fx_version 'adamant'

game 'gta5'

description 'MxM_DubleJob'

version '1.0'

client_script {
    "config.lua",
    "client.lua"
}
  
server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "config.lua",
    "server.lua"
}
  






--