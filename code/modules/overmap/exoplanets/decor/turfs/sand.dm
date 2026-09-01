/turf/simulated/floor/exoplanet/desert
	name = "sand"
	gender = PLURAL
	desc = "It's coarse and gets everywhere."
	icon = 'icons/turf/desert.dmi'
	icon_state = "desert"
	dirt_color = "#ae9e66"
	footstep_sound = SFX_FOOTSTEP_SAND

/turf/simulated/floor/exoplanet/desert/Initialize()
	. = ..()
	icon_state = "desert[rand(1,4)]"

// TODO: Need additional desert turf sprites to distinguish the rough subtype, currently goes no higher than desert4.
/turf/simulated/floor/exoplanet/desert/rough/Initialize()
	. = ..()
	// icon_state = "desert[rand(5,7)]"

/turf/simulated/floor/exoplanet/desert/event/Initialize()
	. = ..()
	icon_state = "desert[rand(1,4)]"
	// insert walter white chemistry gif as i perfectly create a semi-habitable, 'toxic' atmosphere that is mechanically non-toxic
	// (it will equalise with turfs not of this type to distort the exact values, so o2 and n2 concentration will be higher)
	// -> mechanically, you can walk around with no internals in this atmosphere and be fine, you'll just have flavour messages/emotes telling u ur stupid
	temperature = 313
	var/pressure = MOLES_CELLSTANDARD*1.2
	initial_gas = list(
		"oxygen" = pressure*0.19,
		"nitrogen" = pressure*0.25,
		"helium" = pressure*0.37,
		"carbon_dioxide" = pressure*0.05,
		"sulfur_dioxide" = pressure*0.11,
		"chlorine" = pressure*0.01)
