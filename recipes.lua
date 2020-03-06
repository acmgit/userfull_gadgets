minetest.register_craft({
	output = "userfull_gadgets:vacuum",
	recipe = {	{"default:steel_ingot", "default:papyrus", "group:wool"},
				{"", "default:papyrus", ""},
                {"default:mese", "default:chest", "default:mese"}
			}
})


minetest.register_craft({
	output = "userfull_gadgets:magnifier",
	recipe = {
		{"default:glass", "default:mese_crystal_fragment"},
		{"default:stick", ""}
	}
})
