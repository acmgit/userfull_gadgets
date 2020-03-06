local ug = "userfull_gadgets.settings."

-- Set's the range of the Vacuum_Cleaner
userfull_gadgets.settings.vacuum_range = tonumber(minetest.settings:get(ug .. "vacuum_range")) or 8

print("[MOD]" .. userfull_gadgets.modname .. ": Vacuum_range is set to " .. userfull_gadgets.settings.vacuum_range)
minetest.log("[MOD]" .. userfull_gadgets.modname .. ": Vacuum_range is set to " .. userfull_gadgets.settings.vacuum_range)
