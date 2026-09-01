
// ----------------- themes

/datum/exoplanet_theme/desert/cryo_outpost
	name = "Cryo Outpost"

	surface_color = "#5c5142"

/datum/exoplanet_theme/desert/cryo_outpost/mountain
	mountain_threshold = 0.0

/datum/exoplanet_theme/grass/cryo_outpost

	surface_color = "#5c5142"

	surface_turfs = list(
		/turf/simulated/mineral/planet
	)

	mountain_threshold = 0.9

	possible_biomes = list(
		BIOME_COOL = list(
			BIOME_ARID = /singleton/biome/desert/event,
			BIOME_SEMIARID = /singleton/biome/desert/event,
			BIOME_SUBHUMID = /singleton/biome/desert/event
		),
		BIOME_WARM = list(
			BIOME_ARID = /singleton/biome/desert/event,
			BIOME_SEMIARID = /singleton/biome/desert/event,
			BIOME_SUBHUMID = /singleton/biome/desert/event
		),
		BIOME_EQUATOR = list(
			BIOME_ARID = /singleton/biome/desert/event,
			BIOME_SEMIARID = /singleton/biome/desert/event,
			BIOME_SUBHUMID = /singleton/biome/desert/event
		)
	)

	heat_levels = list(
		BIOME_COOL = 1.0,
		BIOME_WARM = 1.0,
		BIOME_EQUATOR = 1.0
	)

	humidity_levels = list(
		BIOME_ARID = 0.2,
		BIOME_SEMIARID = 0.2,
		BIOME_SUBHUMID = 0.2
	)

// ----------------- biomes
