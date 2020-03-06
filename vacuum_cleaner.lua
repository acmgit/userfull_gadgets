local S = userfull_gadgets.S
local report = ""

if userfull_gadgets.settings.vacuum_cleaner then
    report = "on"
        
    -- Code taken form technic
    -- (c) 2012-2013 by RealBadAngel <mk@realbadangel.pl>
    function userfull_gadgets.vacuumize(itemstack, user, pointed_thing)
        local pos = user:getpos()
        local inv = user:get_inventory()
        local vacuum_range = userfull_gadgets.settings.vacuum_range
    
        for _, object in ipairs(minetest.get_objects_inside_radius(pos, vacuum_range)) do
            local luaentity = object:get_luaentity()
        
            if not object:is_player() and luaentity and luaentity.name == "__builtin:item" and luaentity.itemstring ~= "" then
            
                if inv and inv:room_for_item("main", ItemStack(luaentity.itemstring)) then
                    inv:add_item("main", ItemStack(luaentity.itemstring))
                    minetest.sound_play("userfull_gadgets_vacuumcleaner", {
                        to_player = user:get_player_name(),
                    })
                    luaentity.itemstring = ""
                    object:remove()
                
                end -- if inv and
            
            end -- if not object:is_player
        
        end -- for _, object
    
    end -- function userfull_gadgets.vacuumize

    -- Register Vacuum Cleaner
    minetest.register_tool("userfull_gadgets:vacuum", {
        description = S("Vacuum Cleaner"),
        inventory_image = "userfull_gadgets_vacuum.png",
        stack_max = 1,
        on_use = function(itemstack, user, pointed_thing)
            userfull_gadgets.vacuumize(itemstack, user, pointed_thing)
                                                  
        end, -- on_use
    })

    -- Recipe for Vacuum Cleaner
    minetest.register_craft({
        output = "userfull_gadgets:vacuum",
        recipe = {	{"default:steel_ingot", "default:papyrus", "group:wool"},
                    {"", "default:papyrus", ""},
                    {"default:mese", "default:chest", "default:mese"}
                }
    })

    --print("[MOD]" .. userfull_gadgets.modname .. ": Vacuum_range is set to " .. userfull_gadgets.settings.vacuum_range)
    minetest.log("[MOD]" .. userfull_gadgets.modname .. ": Vacuum_range is set to " .. userfull_gadgets.settings.vacuum_range)

else
    report = "off"
    
end

--print("[MOD] " .. userfull_gadgets.modname .. " Vacuum Cleaner turned " .. report .. ".")
minetest.log("[MOD] " .. userfull_gadgets.modname .. " Vacuum Cleaner turned " .. report .. ".")
