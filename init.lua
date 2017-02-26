-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

minetest.register_alias("castle:orb_day", "orbs_of_time:orb_day")
minetest.register_alias("castle:orb_night", "orbs_of_time:orb_night")

minetest.register_tool("orbs_of_time:orb_day", {
	description = S("Orb of Midday"),
	tiles = {"orbs_orb_day.png"},
	inventory_image = "orbs_orb_day.png",
	wield_image = "orbs_orb_day_weild.png",
	stack_max=1,
	on_use = function(itemstack, user)
		minetest.sound_play("orbs_ding", {pos=pos, loop=false})
		minetest.set_timeofday(0.5)
		minetest.sound_play("orbs_birds", {pos=pos, loop=false})
		if not minetest.setting_getbool("creative_mode") then
			itemstack:add_wear(65535/8)
		end
		return itemstack
	end,
})

minetest.register_tool("orbs_of_time:orb_night",{
 description = S("Orb of Midnight"),
	tiles = {"orbs_orb_night.png"},
	inventory_image = "orbs_orb_night.png",
	wield_image = "orbs_orb_night_weild.png",
	stack_max=1,
	on_use = function(itemstack, user)
		minetest.sound_play("orbs_ding", {pos=pos, loop=false})
		minetest.set_timeofday(0)
		minetest.sound_play("orbs_owl", {pos=pos, loop=false})
		if not minetest.setting_getbool("creative_mode") then
			itemstack:add_wear(65535/8)
		end
		return itemstack
	end,
})


minetest.register_tool("orbs_of_time:orb_dawn", {
	description = S("Orb of Dawn"),
	tiles = {"orbs_orb_day.png"},
	inventory_image = "orbs_orb_day.png^[lowpart:50:orbs_orb_night.png",
	wield_image = "orbs_orb_day_weild.png^[lowpart:75:orbs_orb_night_weild.png",
	stack_max=1,
	on_use = function(itemstack, user)
		minetest.sound_play("orbs_ding", {pos=pos, loop=false})
		minetest.set_timeofday(0.2)
		minetest.sound_play("orbs_birds", {pos=pos, loop=false})
		if not minetest.setting_getbool("creative_mode") then
			itemstack:add_wear(65535/8)
		end
		return itemstack
	end,
})

minetest.register_tool("orbs_of_time:orb_dusk",{
	description = S("Orb of Dusk"),
	tiles = {"orbs_orb_night.png"},
	inventory_image = "orbs_orb_night.png^[lowpart:50:orbs_orb_day.png",
	wield_image = "orbs_orb_night_weild.png^[lowpart:75:orbs_orb_day_weild.png",
	stack_max=1,
	on_use = function(itemstack, user)
		minetest.sound_play("orbs_ding", {pos=pos, loop=false})
		minetest.set_timeofday(0.8)
		minetest.sound_play("orbs_owl", {pos=pos, loop=false})
		if not minetest.setting_getbool("creative_mode") then
			itemstack:add_wear(65535/8)
		end
		return itemstack
	end,
})

-----------
--Crafting
-----------

minetest.register_craft( {
  output = "orbs_of_time:orb_day",
  recipe = {
    {"default:diamond", "default:diamond","default:diamond"},
    {"default:diamond", "default:mese_crystal","default:diamond"},
    {"default:diamond", "default:diamond","default:diamond"}
   },
})

minetest.register_craft({
  output = "orbs_of_time:orb_night",
  recipe = {
   {"default:diamond", "default:diamond","default:diamond"},
   {"default:diamond", "default:obsidian_shard","default:diamond"},
   {"default:diamond", "default:diamond","default:diamond"}
  },
})

minetest.register_craft({
  output = "orbs_of_time:orb_dawn 2",
  recipe = {
   {"orbs_of_time:orb_day"},
   {"orbs_of_time:orb_night"},
  },
})

minetest.register_craft({
  output = "orbs_of_time:orb_dusk 2",
  recipe = {
   {"orbs_of_time:orb_night"},
   {"orbs_of_time:orb_day"},
  },
})

-----------
--Loot mod support
-----------

if minetest.get_modpath("loot") then
	loot.register_loot({
		weights = { generic = 10, valuable= 10 },
		payload = {
			stack = ItemStack("orbs_of_time:orb_day"),
			min_size = 1,
			max_size = 1,
		},
	})

	loot.register_loot({
		weights = { generic = 10, valuable= 10 },
		payload = {
			stack = ItemStack("orbs_of_time:orb_night"),
			min_size = 1,
			max_size = 1,
		},
	})

	loot.register_loot({
		weights = { generic = 10, valuable= 10 },
		payload = {
			stack = ItemStack("orbs_of_time:orb_dawn"),
			min_size = 1,
			max_size = 1,
		},
	})

	loot.register_loot({
		weights = { generic = 10, valuable= 10 },
		payload = {
			stack = ItemStack("orbs_of_time:orb_dusk"),
			min_size = 1,
			max_size = 1,
		},
	})

end