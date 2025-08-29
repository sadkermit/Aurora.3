/datum/map_template/ruin/exoplanet/delivery_site
	name = "Delivery Site"
	id = "deliverysite"
	description = "An Orion Express branded delivery site."

	spawn_weight = 1
	spawn_cost = 1

	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED

	// available to all exoplanets, no filters
	ruin_tags = 0

	prefix = "delivery/"
	suffix = "delivery_site.dmm"

	unit_test_groups = list(3)
