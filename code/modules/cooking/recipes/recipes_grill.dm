/singleton/recipe/grilled_meat
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/meat
	)
	reagents = list(/singleton/reagent/sodiumchloride = 1, /singleton/reagent/blackpepper = 1)
	result = /obj/item/reagent_containers/food/snacks/meatsteak/grilled

/singleton/recipe/grilled_meat_spicy
	appliance = GRILL
	items = list(
		/obj/item/reagent_containers/food/snacks/meat
	)
	reagents = list(/singleton/reagent/sodiumchloride = 1, /singleton/reagent/blackpepper = 1, /singleton/reagent/spacespice = 1)
	result = /obj/item/reagent_containers/food/snacks/meatsteak/grilled/spicy

/singleton/recipe/grilled_peppers
	appliance = GRILL | OVEN
	fruit = list("bellpepper" = 1)
	result = /obj/item/reagent_containers/food/snacks/grilled_peppers
