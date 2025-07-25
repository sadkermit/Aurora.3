/obj/item/grenade/chem_grenade
	name = "grenade casing"
	icon_state = "chemg"
	item_state = "chemg"
	desc = "A hand made chemical grenade."
	w_class = WEIGHT_CLASS_SMALL
	force = 2
	det_time = null
	unacidable = 1
	var/stage = 0
	var/state = 0
	var/path = 0
	var/obj/item/device/assembly_holder/detonator = null
	var/list/beakers = new/list()
	var/list/allowed_containers = list(/obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/glass/bottle)
	var/affected_area = 3

	matter = list(DEFAULT_WALL_MATERIAL = 700, MATERIAL_GLASS = 300)

/obj/item/grenade/chem_grenade/feedback_hints(mob/user, distance, is_adjacent)
	. += ..()
	if(detonator)
		. += "With attached [detonator.name]"

/obj/item/grenade/chem_grenade/Initialize()
	. = ..()
	create_reagents(1000)

/obj/item/grenade/chem_grenade/attack_self(mob/user as mob)
	if(!stage || stage==1)
		if(detonator)
			detonator.detached()
			user.put_in_hands(detonator)
			detonator=null
			det_time = null
			stage=0
			icon_state = initial(icon_state)
		else if(beakers.len)
			for(var/obj/B in beakers)
				if(istype(B))
					beakers -= B
					user.put_in_hands(B)
		name = "unsecured grenade with [beakers.len] containers[detonator?" and detonator":""]"
	if(stage > 1 && !active && clown_check(user))
		to_chat(user, SPAN_WARNING("You prime \the [name]!"))

		msg_admin_attack("[user.name] ([user.ckey]) primed \a [src]. (<A href='byond://?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)",ckey=key_name(user))

		activate()
		add_fingerprint(user)
		if(iscarbon(user))
			var/mob/living/carbon/C = user
			C.throw_mode_on()

/obj/item/grenade/chem_grenade/attackby(obj/item/attacking_item, mob/user)

	if(istype(attacking_item,/obj/item/device/assembly_holder) && (!stage || stage==1) && path != 2)
		var/obj/item/device/assembly_holder/det = attacking_item
		if(istype(det.a_left,det.a_right.type) || (!isigniter(det.a_left) && !isigniter(det.a_right)))
			to_chat(user, SPAN_WARNING("Assembly must contain one igniter."))
			return
		if(!det.secured)
			to_chat(user, SPAN_WARNING("Assembly must be secured with screwdriver."))
			return
		path = 1
		to_chat(user, SPAN_NOTICE("You add [attacking_item] to the metal casing."))
		playsound(src.loc, attacking_item.usesound, 25, -3)
		user.remove_from_mob(det)
		det.forceMove(src)
		detonator = det
		if(istimer(detonator.a_left))
			var/obj/item/device/assembly/timer/T = detonator.a_left
			det_time = 10*T.time
		if(istimer(detonator.a_right))
			var/obj/item/device/assembly/timer/T = detonator.a_right
			det_time = 10*T.time
		icon_state = initial(icon_state) +"_ass"
		name = "unsecured grenade with [beakers.len] containers[detonator?" and detonator":""]"
		stage = 1
	else if(attacking_item.isscrewdriver() && path != 2)
		if(stage == 1)
			path = 1
			if(beakers.len)
				to_chat(user, SPAN_NOTICE("You lock the assembly."))
				name = "grenade"
			else
				to_chat(user, SPAN_NOTICE("You lock the empty assembly."))
				name = "fake grenade"
			playsound(src.loc, attacking_item.usesound, 25, -3)
			icon_state = initial(icon_state) +"_locked"
			stage = 2
		else if(stage == 2)
			if(active && prob(95))
				to_chat(user, SPAN_WARNING("You trigger the assembly!"))
				prime()
				return
			else
				to_chat(user, SPAN_NOTICE("You unlock the assembly."))
				playsound(src.loc, attacking_item.usesound, 25, -3)
				name = "unsecured grenade with [beakers.len] containers[detonator?" and detonator":""]"
				icon_state = initial(icon_state) + (detonator?"_ass":"")
				stage = 1
				active = 0
	else if(is_type_in_list(attacking_item, allowed_containers) && (!stage || stage==1) && path != 2)
		path = 1
		if(beakers.len == 2)
			to_chat(user, SPAN_WARNING("The grenade can not hold more containers."))
			return
		else
			if(attacking_item.reagents.total_volume)
				to_chat(user, SPAN_NOTICE("You add \the [attacking_item] to the assembly."))
				user.drop_from_inventory(attacking_item,src)
				beakers += attacking_item
				stage = 1
				name = "unsecured grenade with [beakers.len] containers[detonator?" and detonator":""]"
			else
				to_chat(user, SPAN_WARNING("\The [attacking_item] is empty."))

/obj/item/grenade/chem_grenade/activate(mob/user as mob)
	if(active) return

	if(detonator)
		if(!isigniter(detonator.a_left))
			detonator.a_left.activate()
			active = 1
		if(!isigniter(detonator.a_right))
			detonator.a_right.activate()
			active = 1
	if(active)
		icon_state = initial(icon_state) + "_active"

		if(user)
			msg_admin_attack("[user.name] ([user.ckey]) primed \a [src] (<A href='byond://?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)",ckey=key_name(user))

	return

/obj/item/grenade/chem_grenade/proc/primed(var/primed = 1)
	if(active)
		icon_state = initial(icon_state) + (primed?"_primed":"_active")

/obj/item/grenade/chem_grenade/prime()
	if(!stage || stage<2) return

	var/has_reagents = 0
	for(var/obj/item/reagent_containers/glass/G in beakers)
		if(G.reagents.total_volume)
			has_reagents = 1

	active = 0
	if(!has_reagents)
		icon_state = initial(icon_state) +"_locked"
		playsound(src.loc, 'sound/items/Screwdriver2.ogg', 50, 1)
		spawn(0) //Otherwise det_time is erroneously set to 0 after this
			if(istimer(detonator.a_left)) //Make sure description reflects that the timer has been reset
				var/obj/item/device/assembly/timer/T = detonator.a_left
				det_time = 10*T.time
			if(istimer(detonator.a_right))
				var/obj/item/device/assembly/timer/T = detonator.a_right
				det_time = 10*T.time
		return

	playsound(src.loc, 'sound/effects/bamf.ogg', 50, 1)
	for(var/obj/item/reagent_containers/glass/G in beakers)
		G.reagents.trans_to_obj(src, G.reagents.total_volume)

	if(src.reagents.total_volume) //The possible reactions didnt use up all reagents.
		var/datum/effect/effect/system/steam_spread/steam = new /datum/effect/effect/system/steam_spread()
		steam.set_up(10, 0, get_turf(src))
		steam.attach(src)
		steam.start()

		for(var/atom/A in view(affected_area, src.loc))
			if( A == src ) continue
			src.reagents.touch(A)

	if (iscarbon(loc))		//drop dat grenade if it goes off in your hand
		var/mob/living/carbon/C = loc
		C.drop_from_inventory(src)
		C.throw_mode_off()

	set_invisibility(INVISIBILITY_MAXIMUM) //Why am i doing this?
	//To make sure all reagents can work
	//correctly before deleting the grenade.
	QDEL_IN(src, 50)

/obj/item/grenade/chem_grenade/large
	name = "large chem grenade"
	desc = "An oversized grenade that affects a larger area."
	icon_state = "large_grenade"
	item_state = "largechemg"
	allowed_containers = list(/obj/item/reagent_containers/glass)
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	affected_area = 4

	matter = list(DEFAULT_WALL_MATERIAL = 1000, MATERIAL_GLASS = 500)

/obj/item/grenade/chem_grenade/metalfoam
	name = "metal-foam grenade"
	desc = "Used for emergency sealing of air breaches."
	path = 1
	stage = 2

/obj/item/grenade/chem_grenade/metalfoam/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

	B1.reagents.add_reagent(/singleton/reagent/aluminum, 30)
	B2.reagents.add_reagent(/singleton/reagent/foaming_agent, 10)
	B2.reagents.add_reagent(/singleton/reagent/acid/polyacid, 10)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	beakers += B1
	beakers += B2
	icon_state = initial(icon_state) +"_locked"

/obj/item/grenade/chem_grenade/incendiary
	name = "incendiary grenade"
	desc = "Used for clearing rooms of living things."
	path = 1
	stage = 2

/obj/item/grenade/chem_grenade/incendiary/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

	B1.reagents.add_reagent(/singleton/reagent/aluminum, 15)
	B1.reagents.add_reagent(/singleton/reagent/fuel,20)
	B2.reagents.add_reagent(/singleton/reagent/toxin/phoron, 15)
	B2.reagents.add_reagent(/singleton/reagent/acid, 15)
	B1.reagents.add_reagent(/singleton/reagent/fuel,20)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	beakers += B1
	beakers += B2
	icon_state = initial(icon_state) +"_locked"

/obj/item/grenade/chem_grenade/antiweed
	name = "weedkiller grenade"
	desc = "Used for purging large areas of invasive plant species. Contents under pressure. Do not directly inhale contents."
	path = 1
	stage = 2

/obj/item/grenade/chem_grenade/antiweed/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

	B1.reagents.add_reagent(/singleton/reagent/toxin/plantbgone, 25)
	B1.reagents.add_reagent(/singleton/reagent/potassium, 25)
	B2.reagents.add_reagent(/singleton/reagent/phosphorus, 25)
	B2.reagents.add_reagent(/singleton/reagent/sugar, 25)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	beakers += B1
	beakers += B2
	icon_state = initial(icon_state) +"_locked"

/obj/item/grenade/chem_grenade/gas
	name = "NT. 53 'Sandman' grenade"
	desc = "Used for pacifying rooms full of people with less-than-lethal force. It warns against use on people with lung defects."
	path = 1
	stage = 2

/obj/item/grenade/chem_grenade/gas/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

	B1.reagents.add_reagent(/singleton/reagent/sugar, 20)
	B1.reagents.add_reagent(/singleton/reagent/potassium,20)
	B1.reagents.add_reagent(/singleton/reagent/soporific, 10)
	B1.reagents.add_reagent(/singleton/reagent/dylovene, 10)
	B2.reagents.add_reagent(/singleton/reagent/polysomnine,40)
	B2.reagents.add_reagent(/singleton/reagent/phosphorus,20)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	beakers += B1
	beakers += B2
	icon_state = initial(icon_state) +"_locked"

/obj/item/grenade/chem_grenade/cleaner
	name = "cleaner grenade"
	desc = "BLAM!-brand foaming space cleaner. In a special applicator for rapid cleaning of wide areas."
	stage = 2
	path = 1

/obj/item/grenade/chem_grenade/cleaner/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

	B1.reagents.add_reagent(/singleton/reagent/surfactant, 40)
	B2.reagents.add_reagent(/singleton/reagent/water, 40)
	B2.reagents.add_reagent(/singleton/reagent/spacecleaner, 10)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	beakers += B1
	beakers += B2
	icon_state = initial(icon_state) +"_locked"

/obj/item/grenade/chem_grenade/antifuel
	name = "antifuel grenade"
	desc = "This grenade is loaded with a foaming antifuel compound -- the twenty-fifth century standard for eliminating industrial spills."
	stage = 2
	path = 1

/obj/item/grenade/chem_grenade/antifuel/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

	B1.reagents.add_reagent(/singleton/reagent/surfactant, 40)
	B2.reagents.add_reagent(/singleton/reagent/water, 40)
	B2.reagents.add_reagent(/singleton/reagent/antifuel, 10)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	beakers += B1
	beakers += B2
	icon_state = initial(icon_state) +"_locked"

/obj/item/grenade/chem_grenade/large/phoroncleaner
	name = "large cardox grenade"
	desc = "A large chemical grenade containing a heavy amount of cardox. Use in case of phoron leaks. Warning: Harmful to Vaurca health."
	stage = 2
	path = 1

/obj/item/grenade/chem_grenade/large/phoroncleaner/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/singleton/reagent/toxin/cardox, 40)
	B1.reagents.add_reagent(/singleton/reagent/potassium, 40)
	B2.reagents.add_reagent(/singleton/reagent/phosphorus, 40)
	B2.reagents.add_reagent(/singleton/reagent/sugar, 40)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	beakers += B1
	beakers += B2
	icon_state = initial(icon_state) +"_locked"


/obj/item/grenade/chem_grenade/teargas
	name = "tear gas grenade"
	desc = "Concentrated Capsaicin. Contents under pressure. Use with caution."
	stage = 2
	path = 1

/obj/item/grenade/chem_grenade/teargas/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/singleton/reagent/phosphorus, 40)
	B1.reagents.add_reagent(/singleton/reagent/potassium, 40)
	B1.reagents.add_reagent(/singleton/reagent/capsaicin/condensed, 40)
	B2.reagents.add_reagent(/singleton/reagent/sugar, 40)
	B2.reagents.add_reagent(/singleton/reagent/capsaicin/condensed, 80)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	beakers += B1
	beakers += B2
	icon_state = initial(icon_state) +"_locked"

/obj/item/grenade/chem_grenade/monoammoniumphosphate
	name = "extinguisher grenade"
	desc = "BLAM!-brand foaming extinguisher. Incredibly useful for taking out large chemical fires at a distance."
	stage = 2
	path = 1

/obj/item/grenade/chem_grenade/monoammoniumphosphate/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/B2 = new(src)

	B1.reagents.add_reagent(/singleton/reagent/surfactant, 40)
	B1.reagents.add_reagent(/singleton/reagent/toxin/fertilizer/monoammoniumphosphate, 20)
	B2.reagents.add_reagent(/singleton/reagent/water, 40)
	B2.reagents.add_reagent(/singleton/reagent/toxin/fertilizer/monoammoniumphosphate, 20)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	beakers += B1
	beakers += B2
	icon_state = initial(icon_state) +"_locked"

///Zombie-producing grenade
/obj/item/grenade/chem_grenade/hylemnomil
	name = "hylemnomil grenade"
	desc = "Concentrated hylemnomil. The lab really cooked for this one."
	stage = 2
	path = 1

/obj/item/grenade/chem_grenade/hylemnomil/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)

	B1.reagents.add_reagent(/singleton/reagent/phosphorus, 40)
	B1.reagents.add_reagent(/singleton/reagent/potassium, 40)
	B1.reagents.add_reagent(/singleton/reagent/toxin/hylemnomil, 40)
	B2.reagents.add_reagent(/singleton/reagent/sugar, 40)
	B2.reagents.add_reagent(/singleton/reagent/toxin/hylemnomil, 80)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	var/obj/item/device/assembly/timer/tmr = detonator.a_left
	tmr.time = 2
	detonator.name = "[initial(detonator.name)] ([tmr.time] secs)"

	beakers += B1
	beakers += B2
	icon_state = initial(icon_state) +"_locked"
