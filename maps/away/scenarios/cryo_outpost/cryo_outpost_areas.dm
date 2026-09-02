// ------------------------- base/parent

/area/cryo_outpost
	name = "Outpost"
	icon_state = "bluenew"
	requires_power = TRUE
	no_light_control = FALSE
	base_turf = /turf/simulated/floor/exoplanet/barren
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_INDESTRUCTIBLE_TURFS | AREA_FLAG_IS_BACKGROUND
	holomap_color = "#494949"
	is_outside = OUTSIDE_NO

// ------------------------- outside

/area/cryo_outpost/outside
	area_blurb = "A desolate and dry dune, flanked by steep mesa. The sky above is a sickly yellow-green, with muddy brown, wispy clouds. \
				In the hazed distance, the sand is being kicked up by what must be a sandstorm, and little dust devils are already dancing over the sloped desert."
	is_outside = OUTSIDE_YES

/area/cryo_outpost/outside/landing
	name = "Landing Pad"
	icon_state = "yellow"

/area/cryo_outpost/outside/surface
	name = "Surface"

/area/cryo_outpost/outside/cave
	name = "Cave"
	icon_state = "red"
	is_outside = OUTSIDE_NO
	holomap_color = "#2e2e2e"

/area/cryo_outpost/outside/buildings
	name = "Building"
	is_outside = OUTSIDE_NO

/area/cryo_outpost/outside/colonist_shuttle
	name = "Colonist Transport Shuttle"

/area/cryo_outpost/outside/ee_gunship
	name = "EE Asset Protection Gunship"

/area/cryo_outpost/outside/pirate_hoard
	name = "Modular Countainer Powernet"
	is_outside = OUTSIDE_NO
	requires_power = FALSE

// ------------------------- inside

/area/cryo_outpost/inside
	area_blurb = "Air conditioning, what a relief! \
				It is so much cooler in here and the air much more breathable."
	is_outside = OUTSIDE_NO
	holomap_color = "#777777"

// ------------- hallways

/area/cryo_outpost/inside/entrance_main
	name = "Entrance, Main"
	icon_state = "storage"
	holomap_color = "#8d8d8d"

/area/cryo_outpost/inside/entrance_aux_east
	name = "Entrance, Aux East"
	icon_state = "storage"
	holomap_color = "#8d8d8d"

/area/cryo_outpost/inside/entrance_aux_west
	name = "Entrance, Aux West"
	icon_state = "storage"
	holomap_color = "#8d8d8d"

/area/cryo_outpost/inside/hallway_central
	name = "Hallway, Central"
	icon_state = "hallC"
	holomap_color = "#8d8d8d"

/area/cryo_outpost/inside/hallway_east
	name = "Hallway, East"
	icon_state = "hallC"
	holomap_color = "#8d8d8d"

/area/cryo_outpost/inside/hallway_west
	name = "Hallway, West"
	icon_state = "hallC"
	holomap_color = "#8d8d8d"

// ------------- crew

/area/cryo_outpost/inside/habitation_east
	name = "Habitation, East"
	icon_state = "crew_quarters"
	holomap_color = "#54654c"

/area/cryo_outpost/inside/habitation_west
	name = "Habitation, West"
	icon_state = "crew_quarters"
	holomap_color = "#54654c"

/area/cryo_outpost/inside/canteen
	name = "Kitchen"
	icon_state = "kitchen"
	holomap_color = "#54654c"

/area/cryo_outpost/inside/botany
	name = "Hydroponics"
	icon_state = "garden"
	holomap_color = "#b19664"

/area/cryo_outpost/inside/medical
	name = "Medical"
	icon_state = "medbay"
	holomap_color = "#8daf6a"

/area/cryo_outpost/inside/comms
	name = "Command & Communications"
	icon_state = "bridge"
	holomap_color = "#708997"

/area/cryo_outpost/inside/security
	name = "Security"
	icon_state = "security"
	holomap_color = "#708997"

// ------------- labs

/area/cryo_outpost/inside/labs_hallway
	name = "Command, Hallway"
	icon_state = "hallC"
	holomap_color = "#8a7387"

/area/cryo_outpost/inside/labs_cryo_n
	name = "Command, Cryo North"
	icon_state = "cryo"
	holomap_color = "#8a7387"

/area/cryo_outpost/inside/labs_cryo_s
	name = "Command, Cryo South"
	icon_state = "cryo"
	holomap_color = "#8a7387"

/area/cryo_outpost/inside/labs_cryo_pods
	name = "Command, Heavy Asset Protection Armoury"
	icon_state = "cryo"
	holomap_color = "#8a7387"

/area/cryo_outpost/inside/labs_offices
	name = "Command, Offices"
	icon_state = "research"
	holomap_color = "#8a7387"

/area/cryo_outpost/inside/labs_surgery
	name = "Command, Surgery"
	icon_state = "surgery"
	holomap_color = "#cc9090"

/area/cryo_outpost/inside/labs_rnd
	name = "Command, RnD"
	icon_state = "research"
	holomap_color = "#cc9090"

/area/cryo_outpost/inside/labs_maint_w
	name = "Command, Maint, West"
	icon_state = "maintenance"

/area/cryo_outpost/inside/labs_maint_e
	name = "Command, Maint, East"
	icon_state = "maintenance"

/area/cryo_outpost/inside/labs_pharmacy
	name = "Command, Pharmacy"
	icon_state = "phar"
	holomap_color = "#cc9090"

// ------------- engineering

/area/cryo_outpost/inside/warehouse
	name = "Warehouse"
	icon_state = "storage"
	holomap_color = "#ceb689"

/area/cryo_outpost/inside/engineering
	name = "Engineering"
	icon_state = "engineering"
	holomap_color = "#ceb689"

/area/cryo_outpost/inside/engi_powergen
	name = "Engineering, Power Generation"
	icon_state = "engineering"
	holomap_color = "#ceb689"

/area/cryo_outpost/inside/engi_atmos
	name = "Engineering, Atmospherics"
	icon_state = "engineering"
	holomap_color = "#ceb689"

/area/cryo_outpost/inside/sensors_iff
	name = "Sensors and IFF"
	icon_state = "engineering"
	holomap_color = "#ceb689"

/area/cryo_outpost/inside/eva
	name = "Synthetic Storage"
	icon_state = "engineering"

// ------------------------- maint

/area/cryo_outpost/inside/maint_medbay
	name = "Maint, Medbay"
	icon_state = "maintenance"

/area/cryo_outpost/inside/maint_habitation
	name = "Maint, Habitation"
	icon_state = "maintenance"

/area/cryo_outpost/inside/maint_warehouse
	name = "Maint, Security"
	icon_state = "maintenance"

/area/cryo_outpost/inside/maint_botany
	name = "Maint, Botany"
	icon_state = "maintenance"

/area/cryo_outpost/inside/maint_entrance
	name = "Maint, Entrance"
	icon_state = "maintenance"

/area/cryo_outpost/inside/maint_engineering
	name = "Maint, Engineering"
	icon_state = "maintenance"
