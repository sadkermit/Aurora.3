/singleton/cargo_item/hazmathood
	category = "science"
	name = "hazmat hood"
	supplier = "nanotrasen"
	description = "This hood protects against biological hazards."
	price = 165
	items = list(
		/obj/item/clothing/head/hazmat/general
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/hazmatsuit
	category = "science"
	name = "hazmat suit"
	supplier = "nanotrasen"
	description = "This suit protects against biological hazards."
	price = 200
	items = list(
		/obj/item/clothing/suit/hazmat/general
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/mindshieldfiringpin
	category = "science"
	name = "mindshield firing pin"
	supplier = "nanotrasen"
	description = "This implant - locked firing pin authorizes the weapon for only mindshield-implanted users."
	price = 800
	items = list(
		/obj/item/device/firing_pin/implant/loyalty
	)
	access = ACCESS_HEADS
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/protohuman
	category = "science"
	name = "Proto-Human"
	supplier = "zeng_hu"
	description = "A human body, vat-grown and artificially raised without a functional brain. The everyman's relatively-ethical solution to organ harvesting."
	price = 7200
	items = list(
		/mob/living/carbon/human
	)
	access = ACCESS_RESEARCH
	container_type = "bodybag"
	groupable = FALSE
	spawn_amount = 1

/singleton/cargo_item/proximitysensor
	category = "science"
	name = "proximity sensor"
	supplier = "nanotrasen"
	description = "Used for scanning and alerting when someone enters a certain proximity."
	price = 35
	items = list(
		/obj/item/device/assembly/prox_sensor
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/testrange_firingpin
	category = "science"
	name = "test - range firing pin"
	supplier = "nanotrasen"
	description = "This safety firing pin allows weapons to be fired within proximity to a firing range."
	price = 200
	items = list(
		/obj/item/device/firing_pin/test_range
	)
	access = ACCESS_RESEARCH
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/timer
	category = "science"
	name = "timer"
	supplier = "nanotrasen"
	description = "Used to time things. Works well with contraptions which has to count down. Tick tock."
	price = 22
	items = list(
		/obj/item/device/assembly/timer
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/igniter
	category = "science"
	name = "igniter"
	supplier = "nanotrasen"
	description = "A small electronic device able to ignite combustable substances."
	price = 23
	items = list(
		/obj/item/device/assembly/igniter
	)
	access = 0
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1
