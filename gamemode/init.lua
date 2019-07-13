/*
** Copyright (c) 2017 Jake Green (TheVingard)
** This file is private and may not be shared, downloaded, used or sold.
*/

resource.AddWorkshop("1651398810") -- framework content

DeriveGamemode("sandbox")

MsgC(Color(83, 143, 239), '[impulse] Starting boot sequence...')
print('\nCopyright (c) 2017 Jake Green')
print('No permission is granted to USE, REPRODUCE, EDIT or SELL this software.')

MsgC( Color( 83, 143, 239 ), "[impulse] Starting server load...\n" )
impulse = impulse or {} -- defining global function table

impulse.meta = FindMetaTable( "Player" )
impulse.lib = {}

-- disable widgets cause it uses like 30% server cpu lol
function widgets.PlayerTick()
end

hook.Remove("PlayerTick", "TickWidgets")

-- load the framework bootstrapper

AddCSLuaFile("shared.lua")
include("shared.lua")

MsgC( Color( 0, 255, 0 ), "[impulse] Completed server load...\n" )

-- security overrides, people should have these set anyway, but this is just in case
RunConsoleCommand("sv_allowupload", "0")
RunConsoleCommand("sv_allowdownload", "0")
RunConsoleCommand("sv_allowcslua", "0")

