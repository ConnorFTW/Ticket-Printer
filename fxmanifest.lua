fx_version 'bodacious'
game 'gta5'
author 'Connor Savage'
resource_name 'TicketPrinter'

--███╗░░░███╗░█████╗░██████╗░  ███╗░░░███╗░█████╗░██╗░░██╗███████╗██████╗░░██████╗"
--████╗░████║██╔══██╗██╔══██╗  ████╗░████║██╔══██╗██║░██╔╝██╔════╝██╔══██╗██╔════╝"
--██╔████╔██║██║░░██║██║░░██║  ██╔████╔██║███████║█████═╝░█████╗░░██████╔╝╚█████╗░"
--██║╚██╔╝██║██║░░██║██║░░██║  ██║╚██╔╝██║██╔══██║██╔═██╗░██╔══╝░░██╔══██╗░╚═══██╗"
--██║░╚═╝░██║╚█████╔╝██████╔╝  ██║░╚═╝░██║██║░░██║██║░╚██╗███████╗██║░░██║██████╔╝"
--╚═╝░░░░░╚═╝░╚════╝░╚═════╝░  ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═════╝░"



client_scripts {
    'config.lua',
    'client/**/*.lua',
    'nui2.lua',
}

ui_page "html/index.html"


files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css',
	'html/Main.png',
	'html/options.js',
	'html/Main2.js',
	'html/sounds/demo.ogg',
	'html/Main2.png',

}

shared_script 'config.lua'

server_scripts {
    'server/**/*.lua'
	
}
