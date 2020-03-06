local S = userfull_gadgets.S

local report = ""

if userfull_gadgets.settings.magnifier then
    report = "on"

    -- Shows Information about an Item you point on it
    function userfull_gadgets.show_node(name, pos)

        if pos then
	
            local node = minetest.get_node(pos)
            local light = minetest.get_node_light(pos)
            local dlight = minetest.get_node_light({x=pos.x, y=pos.y -1, z=pos.z})
            local ulight = minetest.get_node_light({x=pos.x, y=pos.y +1, z=pos.z})
            local nodepos = minetest.pos_to_string(pos)
            local protected = minetest.is_protected(pos, name)
		
            userfull_gadgets.print(name, S("Name of the Node: "), userfull_gadgets.purple)
            userfull_gadgets.print(name, node.name, userfull_gadgets.green)
            userfull_gadgets.print(name, S("Located at: ") .. nodepos, userfull_gadgets.green)
            userfull_gadgets.print(name, S("Light on the Node: ") .. light .. ".", userfull_gadgets.yellow)
            userfull_gadgets.print(name, S("Light above: ") .. ulight .. ".", userfull_gadgets.yellow)
            userfull_gadgets.print(name, S("Light under: ") .. dlight .. ".", userfull_gadgets.yellow)
		
            if(protected) then
                userfull_gadgets.print(name, S("Is protected? Yes."), userfull_gadgets.white)
            else
                userfull_gadgets.print(name, S("Is protected: No."), userfull_gadgets.white)
            end
		
            if(minetest.registered_nodes[node.name] ~= nil) then
                if(minetest.registered_nodes[node.name].diggable) then
                    userfull_gadgets.print(name, S("Is diggable."), userfull_gadgets.orange)
                end

                if(minetest.registered_nodes[node.name].walkable) then
                    userfull_gadgets.print(name, S("Is walkable."), userfull_gadgets.orange)
                end

                if(minetest.registered_nodes[node.name].climbable) then
                    userfull_gadgets.print(name, S("Is climbable."), userfull_gadgets.orange)
                end

                if(minetest.registered_nodes[node.name].buildable_to) then
                    userfull_gadgets.print(name, S("Is replaceable."), userfull_gadgets.orange)
                end

                if(minetest.registered_nodes[node.name].liquid_renewable) then
                    userfull_gadgets.print(name, S("Is regenerateable."), userfull_gadgets.orange)
                end
		
                if(minetest.registered_nodes[node.name].use_texture_alpha) then
                    userfull_gadgets.print(name, S("Has an alpha-channel."), userfull_gadgets.orange)
                    userfull_gadgets.print(name, S("With a transparency of ") .. 255 - minetest.registered_nodes[node.name].alpha .. " / 255.", userfull_gadgets.light_blue)
                end

                if(minetest.registered_nodes[node.name].sunlight_propagates) then
                    userfull_gadgets.print(name, S("Light shines trough."), userfull_gadgets.orange)
                end
		
                if(minetest.registered_nodes[node.name].light_source > 0) then
                    userfull_gadgets.print(name, S("Shines with Lightlevel ") .. minetest.registered_nodes[node.name].light_source .. " / 15.", userfull_gadgets.light_blue)
                end
		
                if(minetest.registered_nodes[node.name].damage_per_second > 0) then
                    userfull_gadgets.print(name, S("Deals with ") .. minetest.registered_nodes[node.name].damage_per_second .. S(" Points Damage per Second."),  userfull_gadgets.light_green)
                end
		
                userfull_gadgets.print(name, S("Stacks with ") .. minetest.registered_nodes[node.name].stack_max .. S(" Items / Stack."), userfull_gadgets.light_red)
            else
                userfull_gadgets.print(name, S("Node unknown!"), userfull_gadgets.red)
            end 
		
        else
	
            userfull_gadgets.print(name, S("Pointed on no Node."), userfull_gadgets.red)
	
        end

    end -- userfull_gadgets.show_me()


    -- Magnifier
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

    -- Recipe for Magnifier
    minetest.register_craft({
        output = "userfull_gadgets:magnifier",
        recipe = {
            {"default:glass", "default:mese_crystal_fragment"},
            {"default:stick", ""}
        }
    })
    
else
    report = "off"
    
end

--print("[MOD] " .. userfull_gadgets.modname .. " Magnifier Glass turned " .. report .. ".")
minetest.log("[MOD] " .. userfull_gadgets.modname .. " Magnifier Glass turned " .. report .. ".")
