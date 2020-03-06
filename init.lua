userfull_gadgets = {}
userfull_gadgets.S = nil
userfull_gadgets.settings = {}
userfull_gadgets.vers = "1.0"
userfull_gadgets.modname = minetest.get_current_modname()
userfull_gadgets.modpath = minetest.get_modpath(userfull_gadgets.modname)

-- get Boilerplate
if (minetest.get_translator ~= nil) then
    userfull_gadgets.S = minetest.get_translator(minetest.get_current_modname())
    
else
    userfull_gadgets.S = function ( s ) return s end

end

userfull_gadgets.green = '#00FF00'
userfull_gadgets.red = '#FF0000'
userfull_gadgets.orange = '#FF6700'
userfull_gadgets.blue = '#0000FF'
userfull_gadgets.yellow = '#FFFF00'
userfull_gadgets.purple = '#FF00FF'
userfull_gadgets.pink = '#FFAAFF'
userfull_gadgets.white = '#FFFFFF'
userfull_gadgets.black = '#000000'
userfull_gadgets.grey = '#888888'
userfull_gadgets.light_blue = '#8888FF'
userfull_gadgets.light_green = '#88FF88'
userfull_gadgets.light_red = '#FF8888'
userfull_gadgets.none = 99

dofile(userfull_gadgets.modpath .. "/settings.lua")
dofile(userfull_gadgets.modpath .. "/functions.lua")
dofile(userfull_gadgets.modpath .. "/register_nodes.lua")       
dofile(userfull_gadgets.modpath .. "/recipes.lua")

print("[MOD]" .. userfull_gadgets.modname .. " Version " .. userfull_gadgets.vers .. " successfully loaded.")
minetest.log("[MOD]" .. userfull_gadgets.modname .. " Version " .. userfull_gadgets.vers .. " successfully loaded.")
