/singleton/cargo_item/miningvoidsuit
	category = "mining"
	name = "mining voidsuit"
	supplier = "nanotrasen"
	description = "A special suit that protects against hazardous, low pressure environments. Has reinforced plating."
	price = 800
	items = list(
		/obj/item/clothing/suit/space/void/mining
	)
	access = ACCESS_MINING
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/miningvoidsuithelmet
	category = "mining"
	name = "mining voidsuit helmet"
	supplier = "nanotrasen"
	description = "A special helmet designed for work in a hazardous, low pressure environment. Has reinforced plating."
	price = 500
	items = list(
		/obj/item/clothing/head/helmet/space/void/mining
	)
	access = ACCESS_MINING
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/industrialminingdrill
	category = "mining"
	name = "mining drill"
	supplier = "hephaestus"
	description = "A large industrial drill. Its bore does not penetrate deep enough to access the sublevels."
	price = 5000
	items = list(
		/obj/machinery/mining/drill,
		/obj/machinery/mining/brace,
		/obj/machinery/mining/brace
	)
	access = ACCESS_MINING
	container_type = "crate"
	groupable = TRUE
	spawn_amount = 1

/singleton/cargo_item/orebox
	category = "mining"
	name = "ore box"
	supplier = "hephaestus"
	description = "Contains a box for storing ore."
	price = 150
	items = list(
		/obj/structure/ore_box
	)
	access = 0
	container_type = "box"
	groupable = TRUE
	spawn_amount = 1
