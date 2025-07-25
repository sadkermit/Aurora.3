// Powersink - used to drain station power

/obj/item/device/powersink
	name = "power sink"
	desc = "A nulling power sink which drains energy from electrical systems."
	icon = 'icons/obj/item/device/powersink.dmi'
	icon_state = "powersink0"
	item_state = "powersink0"
	w_class = WEIGHT_CLASS_BULKY
	obj_flags = OBJ_FLAG_CONDUCTABLE
	throwforce = 5
	throw_speed = 1
	throw_range = 2

	matter = list(DEFAULT_WALL_MATERIAL = 750)

	origin_tech = list(TECH_POWER = 3, TECH_ILLEGAL = 5)

	///Amount of power to drain per second, in watts
	var/drain_rate = 1.5 MEGA WATTS

	///Maximum amount of power to drain from a single APW, in watts
	var/apc_drain_rate = 50 KILO WATTS

	///Passive dissipation of drained power in Watts
	var/dissipation_rate = 20000

	///Amount of power drained, in watts
	var/power_drained = 04

	///Power at which the sink will explode (after having absorbed that), in watts
	var/max_power = 800 MEGA WATTS

	var/mode = 0					// 0 = off, 1=clamped (off), 2=operating
	var/drained_this_tick = 0		// This is unfortunately necessary to ensure we process powersinks BEFORE other machinery such as APCs.

	var/datum/powernet/PN			// Our powernet
	var/obj/structure/cable/attached		// the attached cable

/obj/item/device/powersink/antagonist_hints(mob/user, distance, is_adjacent)
	. += ..()
	. += "Dead APCs means their emergency shutters won't automatically close pressure loss. You could rapidly vent an entire department this way."

/obj/item/device/powersink/Destroy()
	PN = null
	attached = null

	return ..()

/obj/item/device/powersink/attackby(obj/item/attacking_item, mob/user)
	if(attacking_item.isscrewdriver())
		if(mode == 0)
			var/turf/T = loc
			if(isturf(T) && !!T.is_plating())
				attached = locate() in T
				if(!attached)
					to_chat(user, SPAN_WARNING("No exposed cable here to attach to."))
				else
					anchored = 1
					mode = 1
					visible_message(SPAN_NOTICE("\The [user] attaches \the [src] to the cable!"))
			else
				to_chat(user, SPAN_WARNING("\The [src] must be placed over an exposed cable to attach to it."))
			return TRUE
		else
			if (mode == 2)
				STOP_PROCESSING(SSprocessing, src)
			anchored = 0
			mode = 0
			visible_message(SPAN_NOTICE("\The [user] detaches \the [src] from the cable!"))
			set_light(0)
			icon_state = "powersink0"
			item_state = "powersink0"

			return TRUE
	else
		return ..()

/obj/item/device/powersink/attack_ai()
	return

/obj/item/device/powersink/attack_hand(var/mob/user)
	if(!mode)
		..()
	else
		toggle_mode(user)

/// Used to be handled in attack_hand(), but moved to its own proc to handle future signaler usage.
/obj/item/device/powersink/proc/toggle_mode(var/mob/user)
	switch(mode)
		if(1)
			if(user)
				visible_message(SPAN_NOTICE("\The [user] activates \the [src]!"))
			else
				visible_message(SPAN_NOTICE("\The [src] suddenly starts to hum!"))
			mode = 2
			icon_state = "powersink1"
			item_state = "powersink1"
			START_PROCESSING(SSprocessing, src)
		if(2)
			if(user)
				visible_message(SPAN_NOTICE("\The [user] deactivates \the [src]!"))
			else
				visible_message(SPAN_NOTICE("\The [src] suddenly goes quiet!"))
			mode = 1
			set_light(0)
			icon_state = "powersink0"
			item_state = "powersink0"
			STOP_PROCESSING(SSprocessing, src)

/obj/item/device/powersink/proc/siphon_power(seconds_per_tick)
	if(!attached)
		return 0

	if(drained_this_tick)
		return 1
	drained_this_tick = 1

	var/drained = 0

	if(!PN)
		return 1

	set_light(12)
	PN.trigger_warning()
	// found a powernet, so drain up to max power from it
	drained = PN.draw_power(drain_rate * seconds_per_tick)
	// if tried to drain more than available on powernet
	// now look for APCs and drain their cells
	if(drained < drain_rate * seconds_per_tick)
		for(var/obj/machinery/power/terminal/T in PN.nodes)
			// Enough power drained this tick, no need to torture more APCs
			if(drained >= drain_rate * seconds_per_tick)
				break
			if(istype(T.master, /obj/machinery/power/apc))
				var/obj/machinery/power/apc/A = T.master
				if(A.operating && A.cell)
					var/cur_charge = A.cell.charge / CELLRATE
					var/drain_val = min(apc_drain_rate * seconds_per_tick, cur_charge)
					A.cell.use(drain_val * CELLRATE)
					drained += drain_val
	power_drained += drained
	return 1

/obj/item/device/powersink/process(seconds_per_tick)
	drained_this_tick = 0
	power_drained -= min(dissipation_rate, power_drained)

	if(attached && attached.powernet)
		PN = attached.powernet
	else
		PN = null

	if(power_drained > max_power * 0.98)	// Lower the screeching period. It was pretty long during testing.
		playsound(src, 'sound/effects/screech.ogg', 100, 1, 1)

	if(power_drained >= max_power)
		handle_overload()
		qdel(src)
		return

	siphon_power(seconds_per_tick)

/obj/item/device/powersink/proc/handle_overload()
	if (QDELETED(src))
		return

	// No attached node, or no powernet.
	if (!PN)
		explosion(src.loc, 0, 1, 3, 6)
		return

	// Propagate the power surge through the powernet nodes.
	for (var/A in PN.nodes)
		if (!A || A == src)
			continue

		var/dist = get_dist(src, A)

		if (dist < 1)
			dist = 1	// For later calculations.
		else if (dist > 24)
			continue	// Out of range.

		// Map it to a range of [3, 1] for severity.
		dist = round(MAP(dist, 1, 28, 3, 1))

		// Check for terminals and affect their master nodes. Also add a special
		// case for APCs whereby their lights are popped or flicked.
		if (istype(A, /obj/machinery/power/terminal))
			var/obj/machinery/power/terminal/T = A
			if (istype(T.master, /obj/machinery/power/apc))
				var/obj/machinery/power/apc/AP = T.master
				if (dist > 1)
					AP.overload_lighting(100, TRUE)
				else
					AP.flicker_all()
			else if (T.master)
				T.master.emp_act(EMP_LIGHT)

		var/atom/aa = A
		aa.emp_act(EMP_LIGHT)

		if (prob(15 * dist))
			explosion(aa.loc, 0, 0, 3, 4)

	// Also destroy the source.
	explosion(src.loc, 0, 0, 1, 2)
