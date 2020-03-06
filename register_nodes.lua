-- get Boilerplate
local S = userfull_gadgets.S

-- Vacuum-cleaner
minetest.register_tool("userfull_gadgets:vacuum", {
	description = S("Vacuum Cleaner"),
	inventory_image = "userfull_gadgets_vacuum.png",
	stack_max = 1,
	on_use = function(itemstack, user, pointed_thing)
        userfull_gadgets.vacuumize(itemstack, user, pointed_thing)
                                                  
    end, -- on_use
})


-- magnifier
minetest.register_craftitem("userfull_gadgets:magnifier", {
	description = S("Magnifying Glass"),
	inventory_image = "userfull_gadgets_magnifier.png",
	stack_max = 1,
	liquids_pointable = true,

	on_use = function(itemstack, user, pointed_thing)
	
		local pos = minetest.get_pointed_thing_position(pointed_thing)
		local name = user:get_player_name()
		
		userfull_gadgets.show_node(name, pos)
	    
	end,-- on_use
})
