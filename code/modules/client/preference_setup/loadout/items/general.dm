/datum/gear/cane
	display_name = "cane and crutch selection"
	description = "A selection of canes and crutches."
	path = /obj/item/cane

/datum/gear/cane/New()
	..()
	var/list/cane = list()
	cane["cane"] = /obj/item/cane
	cane["telescopic cane"] = /obj/item/cane/telecane
	cane["crutch"] = /obj/item/cane/crutch
	cane["forearm crutch"] = /obj/item/cane/crutch/forearm
	cane["white cane"] = /obj/item/cane/telecane/white
	cane["pair of crutches"] = /obj/item/storage/box/crutch_pair
	cane["pair of forearm crutches"] = /obj/item/storage/box/forearm_crutch_pair
	gear_tweaks += new /datum/gear_tweak/path(cane)

/datum/gear/flask
	display_name = "flask"
	path = /obj/item/reagent_containers/food/drinks/flask/barflask

/datum/gear/flask/New()
	..()
	gear_tweaks += new /datum/gear_tweak/reagents(lunchables_all_drink_reagents())

/datum/gear/vacflask_cold
	display_name = "cold vacuum flask"
	path = /obj/item/reagent_containers/food/drinks/flask/vacuumflask

/datum/gear/vacflask_cold/New()
	..()
	gear_tweaks += new /datum/gear_tweak/reagents(lunchables_all_drink_reagents())

/datum/gear/vacflask_cold/spawn_item(var/location, var/metadata)
	. = ..()
	var/obj/item/reagent_containers/food/drinks/flask/vacuumflask/spawned_flask = .
	if(istype(spawned_flask) && spawned_flask.reagents)
		spawned_flask.reagents.set_temperature(T0C + 5)

/datum/gear/vacflask_hot
	display_name = "hot vacuum flask"
	path = /obj/item/reagent_containers/food/drinks/flask/vacuumflask

/datum/gear/vacflask_hot/New()
	..()
	gear_tweaks += new /datum/gear_tweak/reagents(lunchables_all_drink_reagents())

/datum/gear/vacflask_hot/spawn_item(var/location, var/metadata)
	. = ..()
	var/obj/item/reagent_containers/food/drinks/flask/vacuumflask/spawned_flask = .
	if(istype(spawned_flask) && spawned_flask.reagents)
		spawned_flask.reagents.set_temperature(T0C + 45)

/datum/gear/lunchbox
	display_name = "lunchbox"
	description = "A little lunchbox."
	cost = 2
	path = /obj/item/storage/toolbox/lunchbox

/datum/gear/lunchbox/New()
	..()
	var/list/lunchboxes = list()
	for(var/lunchbox_type in typesof(/obj/item/storage/toolbox/lunchbox))
		var/obj/item/storage/toolbox/lunchbox/lunchbox = lunchbox_type
		if(!initial(lunchbox.filled))
			lunchboxes[initial(lunchbox.name)] = lunchbox_type
	sortTim(lunchboxes, GLOBAL_PROC_REF(cmp_text_asc))
	gear_tweaks += new /datum/gear_tweak/path(lunchboxes)
	gear_tweaks += new /datum/gear_tweak/contents(lunchables_lunches(), lunchables_snacks(), lunchables_drinks(), lunchables_utensil())

/datum/gear/coffeecup
	display_name = "coffee cups"
	description = "A coffee cup in various designs."
	cost = 1
	path = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup

/datum/gear/coffeecup/New()
	..()
	var/list/coffeecups = list()
	// plain/base
	coffeecups["plain coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup
	// nations
	coffeecups["sol coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/sol
	coffeecups["San Colette coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/sancolette
	coffeecups["Europa coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/europa
	coffeecups["dominian coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/dom
	coffeecups["Sedantis coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/metal/sedantis
	coffeecups["CoC coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/metal/coc
	coffeecups["Eridani coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/eridani
	coffeecups["Elyra coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/elyra
	coffeecups["Port Antillia coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/portantillia
	coffeecups["All-Xanu Republic cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/xanu
	coffeecups["Galatea cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/galatea
	// orgs/corpos
	coffeecups["SCC coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/scc
	coffeecups["SCC coffee cup, alt"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/scc/alt
	coffeecups["NT coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/nt
	coffeecups["Hephaestus coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/metal/hepht
	coffeecups["Idris coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/idris
	coffeecups["Zeng-Hu coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/zeng
	coffeecups["Zavod coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/zavod
	coffeecups["Orion coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/orion
	coffeecups["TCFL coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/tcfl
	coffeecups["EE coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/einstein
	coffeecups["EE coffee cup, alt"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/einstein/alt
	// symbols, markings
	coffeecups["#1 coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/one
	coffeecups["#1 monkey coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/puni
	coffeecups["heart coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/heart
	coffeecups["pawn coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/pawn
	coffeecups["diona coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/diona
	coffeecups["british coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/britcup
	coffeecups["shumaila coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/shumaila
	coffeecups["nated coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/nated
	coffeecups["vahzirthaamro coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/kingazunja
	coffeecups["hadii coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/hadii
	coffeecups["njarir coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/njarir
	coffeecups["m'sai coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/msai
	coffeecups["hharar coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/hharar
	coffeecups["zhan coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/zhan
	// pure colors & other
	coffeecups["black coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/black
	coffeecups["green coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/green
	coffeecups["dark green coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/green/dark
	coffeecups["rainbow coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/rainbow
	coffeecups["metal coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/metal
	coffeecups["glass coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/glass
	coffeecups["tall coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/tall
	coffeecups["tall black coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/tall/black
	coffeecups["tall metal coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/tall/metal
	coffeecups["tall rainbow coffee cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/tall/rainbow
	gear_tweaks += new /datum/gear_tweak/path(coffeecups)
	gear_tweaks += new /datum/gear_tweak/reagents(lunchables_drink_reagents())

/datum/gear/coffeecup/spawn_item(var/location, var/metadata)
	. = ..()
	var/obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/spawned_cup = .
	if(istype(spawned_cup) && spawned_cup.reagents)
		spawned_cup.reagents.set_temperature(T0C + 45)

/datum/gear/teacup
	display_name = "tea cups"
	description = "Tea cups in various designs."
	cost = 1
	path = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/teacup

/datum/gear/teacup/New()
	..()
	var/list/teacups = list()
	teacups["plain tea cup"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/teacup
	teacups["clay yunomi"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/konyang
	teacups["grey yunomi"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/konyang/grey
	teacups["glazed pattern yunomi"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/konyang/pattern
	teacups["manila pattern yunomi"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/konyang/manila
	teacups["nature pattern yunomi"] = /obj/item/reagent_containers/food/drinks/drinkingglass/newglass/konyang/nature

	gear_tweaks += new /datum/gear_tweak/path(teacups)
	gear_tweaks += new /datum/gear_tweak/reagents(lunchables_drink_reagents())

/datum/gear/teacup/spawn_item(var/location, var/metadata)
	. = ..()
	var/obj/item/reagent_containers/food/drinks/drinkingglass/newglass/coffeecup/teacup/spawned_cup = .
	if(istype(spawned_cup) && spawned_cup.reagents)
		spawned_cup.reagents.set_temperature(T0C + 45)

/datum/gear/chatins
	display_name = "konyang-cha tins"
	description = "Tins of tea leaves made by Konyang-cha."
	cost = 1
	path = /obj/item/storage/box/tea

/datum/gear/chatins/New()
	..()
	var/list/chatins = list()
	chatins["sencha cha-tin"] = /obj/item/storage/box/tea
	chatins["tieguanyin cha-tin"] = /obj/item/storage/box/tea/tieguanyin
	chatins["jaekseol cha-tin"] = /obj/item/storage/box/tea/jaekseol
	gear_tweaks += new /datum/gear_tweak/path(chatins)

/datum/gear/teapots
	display_name = "teapots"
	description = "A selection of teapots."
	cost = 1
	path = /obj/item/reagent_containers/glass/beaker/teapot

/datum/gear/teapots/New()
	..()
	var/list/teapots = list()
	teapots["teapot"] = /obj/item/reagent_containers/glass/beaker/teapot
	teapots["gaiwan"] = /obj/item/reagent_containers/glass/beaker/teapot/lidded
	teapots["kyusu"] = /obj/item/reagent_containers/glass/beaker/teapot/lidded/kyusu
	gear_tweaks += new /datum/gear_tweak/path(teapots)

/datum/gear/standard
	display_name = "dominian great house standard selection"
	path = /obj/item/flag
	flags = GEAR_HAS_DESC_SELECTION

/datum/gear/towel
	display_name = "towel"
	path = /obj/item/towel
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/handkerchief
	display_name = "handkerchief"
	path = /obj/item/reagent_containers/glass/rag/handkerchief
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/comic
	display_name = "comic selection"
	description = "A selection of comics, manga, and magazines from across the Spur."
	path = /obj/item/toy/comic

/datum/gear/comic/New()
	..()
	var/list/comics = list()
	comics["comic book"] = /obj/item/toy/comic
	comics["inspector 404 manga"] = /obj/item/toy/comic/inspector
	comics["stormman manga"] = /obj/item/toy/comic/stormman
	comics["dominian witchfinder novel"] = /obj/item/toy/comic/witchfinder
	gear_tweaks += new /datum/gear_tweak/path(comics)

/datum/gear/toothpaste
	display_name = "dental hygiene kit"
	path = /obj/item/storage/box/toothpaste

/datum/gear/toothpaste/New()
	..()
	var/list/toothpaste = list()
	toothpaste["dental hygiene kit, blue toothbrush"] = /obj/item/storage/box/toothpaste
	toothpaste["dental hygiene kit, green toothbrush"] = /obj/item/storage/box/toothpaste/green
	toothpaste["dental hygiene kit, red toothbrush"] = /obj/item/storage/box/toothpaste/red
	gear_tweaks += new /datum/gear_tweak/path(toothpaste)

/datum/gear/photo
	display_name = "photo"
	path =  /obj/item/photo
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION

/datum/gear/photo_album
	display_name = "photo album"
	path =  /obj/item/storage/photo_album
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION

/datum/gear/knitting_set
	display_name = "knitting set"
	path =  /obj/item/storage/box/knitting
	description = "A box of knitting supplies."
	flags = null

/datum/gear/yarn_box
	display_name = "knitting supplies"
	path =  /obj/item/storage/box/yarn
	description = "A box containing yarn."
	flags = null

/datum/gear/aurora_miniature
	display_name = "aurora miniature"
	description = "A commemorative miniature of the NSS Aurora."
	path = /obj/item/toy/aurora

/datum/gear/instruments
	display_name = "instrument selection"
	description = "A selection of instruments for the musically inclined."
	path = /obj/item/device/synthesized_instrument
	allowed_roles = list("Off-Duty Crew Member", "Passenger")

/datum/gear/instruments/New()
	..()
	var/list/instruments = list()
	instruments["guitar"] = /obj/item/device/synthesized_instrument/guitar
	instruments["polyguitar"] = /obj/item/device/synthesized_instrument/guitar/multi
	instruments["violin"] = /obj/item/device/synthesized_instrument/violin
	instruments["Omnitrumpet"] = /obj/item/device/synthesized_instrument/trumpet
	gear_tweaks += new /datum/gear_tweak/path(instruments)

/datum/gear/lore_radio
	display_name = "analog radio"
	path = /obj/item/lore_radio

/datum/gear/pottedplant_small
	display_name = "potted plant"
	description = "A small potted plant."
	cost = 1
	path = /obj/item/flora/pottedplant_small/dead

/datum/gear/pottedplant_small/New()
	..()
	var/list/plants = list()
	for(var/plant_type in typesof(/obj/item/flora/pottedplant_small))
		var/obj/item/flora/pottedplant_small/plant = plant_type
		plants[initial(plant.name)] = plant_type
	sortTim(plants, GLOBAL_PROC_REF(cmp_text_asc))
	gear_tweaks += new /datum/gear_tweak/path(plants)
