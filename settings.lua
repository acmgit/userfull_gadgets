local ug = "userfull_gadgets.settings."

-- Set's the range of the Vacuum_Cleaner
userfull_gadgets.settings.vacuum_range = tonumber(minetest.settings:get(ug .. "vacuum_range")) or 8
userfull_gadgets.settings.vacuum_cleaner = minetest.settings:get_bool(ug .. "vacuum_cleaner", true)
userfull_gadgets.settings.magnifier = minetest.settings:get_bool(ug .. "magnifier", true)
