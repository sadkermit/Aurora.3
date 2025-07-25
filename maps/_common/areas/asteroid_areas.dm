// GENERIC MINING AREAS

/area/mine
	icon_state = "mining"
	music = list('sound/music/ambimine.ogg', 'sound/music/song_game.ogg')
	sound_environment = SOUND_AREA_ASTEROID
	area_flags = AREA_FLAG_IS_BACKGROUND

/area/mine/explored
	name = "Mine"
	icon_state = "explored"

/area/mine/unexplored
	name = "Mine"
	icon_state = "unexplored"
	area_flags = AREA_FLAG_HIDE_FROM_HOLOMAP

// Smalls
/area/outpost
	ambience = AMBIENCE_EXPOUTPOST

// Main mining
/area/outpost/mining_main
	icon_state = "outpost_mine_main"
	station_area = TRUE
	holomap_color = HOLOMAP_AREACOLOR_OPERATIONS

/area/outpost/mining_main/eva
	name = "Mining EVA storage"

/area/outpost/mining_main/refinery
	name = "Mining Refinery"

// Engineering
/area/outpost/engineering
	icon_state = "outpost_engine"
	station_area = TRUE
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/outpost/engineering/hallway
	name = "Engineering - Sublevel Hallway"

/area/outpost/engineering/atmospherics
	name = "Engineering - Sublevel Atmospherics"

/area/outpost/engineering/power
	name = "Engineering - Tesla Bay"

/area/outpost/engineering/telecomms
	name = "Engineering - Sublevel Telecommunications"

/area/outpost/engineering/storage
	name = "Engineering - Sublevel Storage"

/area/outpost/engineering/meeting
	name = "Engineering - Break Room"

// Research
/area/outpost/research
	icon_state = "outpost_research"
	station_area = TRUE
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/outpost/research/hallway
	name = "Research - Sublevel Hallway"

/area/outpost/research/dock
	name = "Research Shuttle Dock"

/area/outpost/research/eva
	name = "Research - Xenoarchaeology"

/area/outpost/research/analysis
	name = "Research - Sample Analysis"

/area/outpost/research/chemistry
	name = "Research - Chemistry"

/area/outpost/research/medical
	name = "Research Medical"

/area/outpost/research/power
	name = "Research Maintenance"

/area/outpost/research/isolation_a
	name = "Research - Isolation A"

/area/outpost/research/isolation_b
	name = "Research - Isolation B"

/area/outpost/research/isolation_c
	name = "Research - Isolation C"

/area/outpost/research/isolation_monitoring
	name = "Research - Isolation Monitoring"

/area/outpost/research/lab
	name = "Research - Sublevel Laboratory"

/area/outpost/research/kitchen
	name = "Research - Kitchen"

/area/outpost/research/disposal
	name = "Research - Waste Disposal"
