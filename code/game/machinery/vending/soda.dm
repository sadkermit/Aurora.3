/**
 *	Idris Re-Fresh
 *		Low Supply
 *		Konyang
 *	Zo'ra Soda
 *		Low Supply
 *	BODA (Soviet Soda)
 */

/obj/machinery/vending/cola
	name = "Idris Re-Fresh"
	desc = "A soft drink vendor provided by an Idris subsidiary."
	icon_state = "cola_machine"
	icon_vend = "cola_machine-vend"
	icon_deny = "cola_machine-deny"
	icon_screen = "cola_machine-screen"
	light_mask = "cola_machine-lightmask"
	product_slogans = "Idris Re-Fresh: the more expensive the place, the more of us you'll seee!"
	product_ads = "Refreshing!;Hope you're thirsty!;Thirsty? Why not cola?;Please, have a drink!;Drink up!;The best drinks in space."
	vend_id = "cola"
	products = list(
		/obj/item/reagent_containers/food/drinks/cans/cola = 10,
		/obj/item/reagent_containers/food/drinks/cans/diet_cola = 10,
		/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind = 10,
		/obj/item/reagent_containers/food/drinks/cans/dr_gibb = 10,
		/obj/item/reagent_containers/food/drinks/cans/root_beer = 10,
		/obj/item/reagent_containers/food/drinks/cans/starkist = 10,
		/obj/item/reagent_containers/food/drinks/waterbottle = 10,
		/obj/item/reagent_containers/food/drinks/cans/space_up = 10,
		/obj/item/reagent_containers/food/drinks/cans/iced_tea = 10,
		/obj/item/reagent_containers/food/drinks/cans/grape_juice = 10,
		/obj/item/reagent_containers/food/drinks/cans/peach_soda = 10,
		/obj/item/reagent_containers/food/drinks/cans/beetle_milk = 10,
		/obj/item/reagent_containers/food/drinks/carton/small/milk = 10,
		/obj/item/reagent_containers/food/drinks/carton/small/milk/choco = 10,
		/obj/item/reagent_containers/food/drinks/carton/small/milk/strawberry = 10,
		/obj/item/reagent_containers/food/drinks/cans/melon_soda = 10,
		/obj/item/reagent_containers/food/drinks/zobo = 10
	)
	contraband = list(
		/obj/item/reagent_containers/food/drinks/cans/thirteenloko = 5
	)
	premium = list(
		/obj/item/reagent_containers/food/drinks/bottle/cola = 2,
		/obj/item/reagent_containers/food/drinks/bottle/space_mountain_wind = 2,
		/obj/item/reagent_containers/food/drinks/bottle/space_up = 2
	)
	prices = list(
		/obj/item/reagent_containers/food/drinks/cans/cola = 1.50,
		/obj/item/reagent_containers/food/drinks/cans/diet_cola = 1.50,
		/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind = 1.50,
		/obj/item/reagent_containers/food/drinks/cans/dr_gibb = 1.50,
		/obj/item/reagent_containers/food/drinks/cans/root_beer = 1.50,
		/obj/item/reagent_containers/food/drinks/cans/starkist = 1.50,
		/obj/item/reagent_containers/food/drinks/waterbottle = 1.25,
		/obj/item/reagent_containers/food/drinks/cans/space_up = 1.50,
		/obj/item/reagent_containers/food/drinks/cans/iced_tea = 1.40,
		/obj/item/reagent_containers/food/drinks/cans/grape_juice = 1.75,
		/obj/item/reagent_containers/food/drinks/cans/peach_soda = 1.75,
		/obj/item/reagent_containers/food/drinks/cans/beetle_milk = 2.25,
		/obj/item/reagent_containers/food/drinks/carton/small/milk = 1.80,
		/obj/item/reagent_containers/food/drinks/carton/small/milk/choco = 1.80,
		/obj/item/reagent_containers/food/drinks/carton/small/milk/strawberry = 1.80,
		/obj/item/reagent_containers/food/drinks/cans/melon_soda = 1.75,
		/obj/item/reagent_containers/food/drinks/zobo = 1.75
	)
	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
	vending_sound = 'sound/machines/vending/vending_cans.ogg'
	temperature_setting = -1
	light_color = COLOR_GUNMETAL

/obj/machinery/vending/cola/low_supply
	products = list(
		/obj/item/reagent_containers/food/drinks/cans/diet_cola = 1,
		/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind = 2,
		/obj/item/reagent_containers/food/drinks/cans/dr_gibb = 1,
		/obj/item/reagent_containers/food/drinks/cans/root_beer = 2,
		/obj/item/reagent_containers/food/drinks/cans/starkist = 1,
		/obj/item/reagent_containers/food/drinks/waterbottle = 4,
		/obj/item/reagent_containers/food/drinks/cans/space_up = 2,
		/obj/item/reagent_containers/food/drinks/cans/beetle_milk = 8
	)

/obj/machinery/vending/cola/konyang
	products = list(
		/obj/item/reagent_containers/food/drinks/cans/cola = 10,
		/obj/item/reagent_containers/food/drinks/cans/diet_cola = 10,
		/obj/item/reagent_containers/food/drinks/cans/space_mountain_wind = 10,
		/obj/item/reagent_containers/food/drinks/cans/starkist = 10,
		/obj/item/reagent_containers/food/drinks/waterbottle = 10,
		/obj/item/reagent_containers/food/drinks/cans/space_up = 10,
		/obj/item/reagent_containers/food/drinks/cans/iced_tea = 10,
		/obj/item/reagent_containers/food/drinks/cans/grape_juice = 10,
		/obj/item/reagent_containers/food/drinks/cans/peach_soda = 10,
		/obj/item/reagent_containers/food/drinks/cans/beetle_milk = 5,
		/obj/item/reagent_containers/food/drinks/carton/small/milk = 10,
		/obj/item/reagent_containers/food/drinks/carton/small/milk/choco = 10,
		/obj/item/reagent_containers/food/drinks/carton/small/milk/strawberry = 10,
		/obj/item/reagent_containers/food/drinks/cans/melon_soda = 10
	)

/obj/item/device/vending_refill/cola
	name = "cola resupply canister"
	vend_id = "cola"
	charges = 50

/obj/machinery/vending/sovietsoda
	name = "BODA"
	desc = "An old sweet water vending machine, how did this end up here?"
	icon_state = "sovietsoda"
	icon_vend = "sovietsoda-vend"
	vend_id = "cola"
	product_ads = "For Tsar and Country.;Have you fulfilled your nutrition quota today?;Very nice!;We are simple people, for this is all we eat.;If there is a person, there is a problem. If there is no person, then there is no problem."
	products = list(
		/obj/item/reagent_containers/food/drinks/drinkingglass/soda = 30
	)
	//would a soviet vending machine really have a premium item? hmmm.
	premium = list(
		/obj/item/reagent_containers/food/drinks/bottle/vodka = 5
	)
	contraband = list(
		/obj/item/reagent_containers/food/drinks/drinkingglass/cola = 20
	)
	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
	random_itemcount = 0
	temperature_setting = -1
	vending_sound = 'sound/machines/vending/vending_cans.ogg'
	light_color = COLOR_RED
