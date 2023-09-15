fx_version 'adamant'
games {'gta5'}

shared_script {'config.lua', '@es_extended/imports.lua'}

server_script {'server.lua'}

client_scripts {"RageUI/RMenu.lua", "RageUI/menu/RageUI.lua", "RageUI/menu/Menu.lua", "RageUI/menu/MenuController.lua",
                "RageUI/components/*.lua", "RageUI/menu/elements/*.lua", "RageUI/menu/items/*.lua",
                "RageUI/menu/panels/*.lua", "RageUI/menu/panels/*.lua", "RageUI/menu/windows/*.lua", 'client.lua',
                'functions.lua'}
