/singleton/biome/barren
	turf_type = /turf/simulated/floor/exoplanet/barren
	generators = list()
	spawn_types = list()

/singleton/biome/barren/asteroid
	turf_type = /turf/simulated/floor/exoplanet/asteroid/ash
	generators = list(
		WILDLIFE = list(POISSON_SAMPLE, 15)
	)
	spawn_types = list()

/singleton/biome/barren/raskara
	turf_type = /turf/simulated/floor/exoplanet/barren/raskara

/singleton/biome/barren/asteroid/ice
	turf_type = /turf/simulated/floor/exoplanet/ice

/singleton/biome/barren/pid
	turf_type = /turf/simulated/floor/exoplanet/barren
	generators = list(SMALL_FLORA = list(POISSON_SAMPLE, 7))
	spawn_types = list(
		SMALL_FLORA = list(
			/obj/effect/landmark/exoplanet_spawn/plant = 2
		)
	)
