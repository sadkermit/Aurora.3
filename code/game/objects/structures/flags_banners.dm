//
// Flags
//

// Flag Item
/obj/item/flag
	name = "boxed flag"
	desc = "A flag neatly folded into a wooden container."
	icon = 'icons/obj/structure/flags.dmi'
	icon_state = "flag_boxed"
	var/flag_path

	///Boolean, set to `TRUE` if a flag is large (2x1)
	var/flag_size = FALSE

	var/obj/structure/sign/flag/flag_structure
	var/stand_icon = "banner_stand"

// Flag on Wall
/obj/structure/sign/flag
	name = "blank flag"
	desc = "Nothing to see here."
	icon = 'icons/obj/structure/flags.dmi'
	icon_state = "flag"

	///If a big flag, the other half of the flag is referenced here
	var/obj/structure/sign/flag/linked_flag

	var/obj/item/flag/flag_item //For returning your flag

	///Boolean, if we've been torn down
	var/ripped = FALSE

	///Default offset value. Used in accurately locating the turf we're standing on.
	var/offset_constant = 32
	///Boolean, set to TRUE if someone is folding the banner.
	var/currently_folding = FALSE
	var/ripped_outline_state = "flag_ripped"
	var/flag_path
	var/flag_size
	var/icon/flag_icon
	var/icon/shading_icon
	var/icon/banner_icon
	var/icon/rolled_outline
	var/unmovable = FALSE
	var/stand_icon = "banner_stand"

/obj/structure/sign/flag/Initialize(mapload, var/newdir, var/linked_flag_path, var/deploy, var/icon_file, var/item_flag_path)
	. = ..()
	dir = newdir

	if(!flag_path)
		if(item_flag_path) // redundancy
			flag_path = item_flag_path
		else
			flag_path = icon_state

	if(deploy)
		switch(dir)
			if(NORTH)
				pixel_y = 32
			if(SOUTH)
				pixel_y = -32
			if(EAST)
				pixel_x = 32
			if(WEST)
				pixel_x = -32

	if(linked_flag_path)
		icon_state = "[linked_flag_path]_r"
		ripped_outline_state = "flag_ripped_r"
		flag_icon = new(icon_file, icon_state, dir)
		shading_icon = new('icons/obj/structure/flags.dmi', "flag_r", dir)
		flag_icon.Blend(shading_icon, ICON_MULTIPLY)
		icon = flag_icon
		return

	//Handles the creation of the large flags and single flags
	if(flag_size)
		create_other_half(loc, dir, flag_path, icon, pixel_x, pixel_y)
	else
		icon_state = "[flag_path]"
		flag_icon = new(icon, icon_state)
		shading_icon = new('icons/obj/structure/flags.dmi', "flag")
		flag_icon.Blend(shading_icon, ICON_MULTIPLY)
		var/turf/T = locate(x + src.pixel_x / offset_constant, y + src.pixel_y / offset_constant, z)
		if(iswall(T))
			icon = flag_icon
			return
		for(var/obj/A in T)
			if(istype(A, /obj/structure/window))
				icon = flag_icon
				return
		banner_icon = new('icons/obj/structure/flags.dmi', stand_icon)
		flag_icon.Blend(banner_icon, ICON_UNDERLAY)
		verbs += /obj/structure/sign/flag/proc/toggle
		icon = flag_icon

/**
 * If the flag is a big flag, handles the creation and alignment of the other half of it
 *
 * * loc - The location where to create the flag (before transformation)
 * * dir - The direction of the flag
 * * flag_path - The `icon_state` that the other half will have (flag_path + "_l")
 * * icon - The icon
 * * offset_x - Pixel shift that was applied to the first half of the flag, if any
 * * offset_y - Pixel shift that was applied to the first half of the flag, if any
 */
/obj/structure/sign/flag/proc/create_other_half(loc, dir, flag_path, icon, offset_x, offset_y)
	SHOULD_NOT_SLEEP(TRUE)

	icon_state = "[flag_path]_l" // Just adding to the flag spaghetti.
	ripped_outline_state = "flag_ripped_l"
	flag_icon = new(icon, icon_state, dir)
	shading_icon = new('icons/obj/structure/flags.dmi', "flag_l", dir)
	flag_icon.Blend(shading_icon, ICON_MULTIPLY)
	var/obj/structure/sign/flag/F2 = new(loc, dir, linked_flag_path = flag_path, icon_file = icon)
	src.icon = flag_icon
	linked_flag = F2

	//Apply the pixel shifting based on the direction to the new other half of the flag
	switch(F2.dir)
		if(NORTH)
			F2.pixel_x = 32
		if(SOUTH)
			F2.pixel_x = 32
		if(EAST)
			F2.pixel_y = -32
		if(WEST)
			F2.pixel_y = 32

	//Apply the offsets we received
	F2.pixel_x += offset_x
	F2.pixel_y += offset_y

	//Finish configuring the second half of the instance
	F2.linked_flag = src
	F2.name = name
	F2.desc = desc
	F2.desc_extended = desc_extended
	F2.flag_item = flag_item

	//Requeue the area for smoothing, just in case
	QUEUE_SMOOTH(src)
	QUEUE_SMOOTH_NEIGHBORS(src)

/obj/structure/sign/flag/New(loc, var/newdir, var/linked_flag_path, var/deploy, var/icon_file, var/item_flag_path)
	. = ..()

/obj/item/flag/attack_self(mob/user)
	if(flag_size)
		return

	if(use_check_and_message(user))
		return

	for(var/obj/A in get_step(get_turf(user), user.dir))
		if(!iswall(A) && !istype(A, /obj/structure/table) && !istype(A, /obj/structure/window_frame) && !istype(A, /obj/structure/window))
			if(A.density || istype(A, /obj/structure/bed))
				to_chat(user, SPAN_WARNING("You can't place this here, [A.name] is blocking the way!"))
				return
		continue

	if(isfloor(user.loc))
		user.visible_message(SPAN_NOTICE("\The [user] deploys \the [src] on \the [get_turf(loc)]."), SPAN_NOTICE("You deploy \the [src] on \the [get_turf(loc)]."))
		user.drop_from_inventory(src)
		new flag_structure(user.loc, user.dir, deploy = TRUE, item_flag_path = flag_path)
		qdel(src)

/obj/item/flag/afterattack(var/atom/A, var/mob/user, var/adjacent)
	if(!adjacent)
		return

	if(use_check_and_message(user))
		return

	if((!iswall(A) && !istype(A, /obj/structure/window)) || !isturf(user.loc))
		to_chat(user, SPAN_WARNING("You can't place this here!"))
		return

	var/placement_dir = get_dir(user, A)
	if (!(placement_dir in GLOB.cardinals))
		to_chat(user, SPAN_WARNING("You must stand directly in front of the location you wish to place that on."))
		return

	user.visible_message(SPAN_NOTICE("\The [user] fastens \the [src] to \the [A]."), SPAN_NOTICE("You fasten \the [src] to \the [A]."))
	user.drop_from_inventory(src)
	new flag_structure(user.loc, placement_dir, deploy = TRUE, item_flag_path = flag_path)
	qdel(src)


/obj/structure/sign/flag/Destroy()
	if(linked_flag?.linked_flag == src) // Catches other instances where one half might be destroyed, say by a broken wall, to avoid runtimes.
		linked_flag.linked_flag = null // linked_flag
	. = ..()

/obj/structure/sign/flag/ex_act(severity)
	switch(severity)
		if(1)
			qdel(src)
		if(2)
			if(prob(50))
				qdel(src)
			else
				rip()
		if(3)
			rip()

/obj/structure/sign/flag/unfasten(mob/user)
	if(unmovable)
		return
	if(!ripped)
		if(banner_icon)
			user.visible_message(SPAN_NOTICE("\The [user] collapses \the [src] and folds it back up."), SPAN_NOTICE("You collapse \the [src] and fold it back up."))
		else
			user.visible_message(SPAN_NOTICE("\The [user] unfastens \the [src] and folds it back up."), SPAN_NOTICE("You unfasten \the [src] and fold it back up."))
		var/obj/item/flag/F = new flag_item(get_turf(user))
		user.put_in_hands(F)
	else
		user.visible_message(SPAN_NOTICE("\The [user] unfastens the tattered remnants of \the [src]."), SPAN_NOTICE("You unfasten the tattered remains of \the [src]."))
	if(linked_flag)
		qdel(linked_flag) // Otherwise you're going to get weird duping nonsense.
	qdel(src)

/obj/structure/sign/flag/attack_hand(mob/user)
	switch(user.a_intent)
		if(I_HELP)
			examinate(user, src)
		if(I_DISARM)
			if(currently_folding)
				to_chat(user, SPAN_WARNING("You are already folding up \the [src]."))
				return
			currently_folding = TRUE
			user.visible_message(SPAN_NOTICE("\The [user] begins to carefully fold up \the [src]."), SPAN_NOTICE("You begin to carefully fold up \the [src]."))
			if(do_after(user, 50))
				unfasten(user)
			else
				currently_folding = FALSE
		if(I_GRAB)
			user.visible_message(SPAN_NOTICE("\The [user] salutes \the [src]."), SPAN_NOTICE("You salute \the [src]."))
		if(I_HURT)
			if(unmovable || ripped)
				return
			if(alert("Do you want to rip \the [src] from its place?","You think...","Yes","No") == "Yes")
				if(!Adjacent(user)) // Cannot bring up dialogue and walk away.
					return FALSE
				user.visible_message(SPAN_WARNING("\The [user] starts to grab hold of \the [src] with destructive intent!"), SPAN_WARNING("You grab hold of \the [src] with destructive intent!"),)
				if(!do_after(user, 5 SECONDS, src))
					return FALSE
				user.visible_message(SPAN_WARNING("\The [user] rips \the [src] in a single, decisive motion!"), SPAN_WARNING("You rip \the [src] in a single, decisive motion!"))
				playsound(src.loc, 'sound/items/poster_ripped.ogg', 100, 1)
				add_fingerprint(user)
				rip(user)

/obj/structure/sign/flag/proc/rip(mob/user, var/rip_linked = TRUE)
	var/icon/ripped_outline = new('icons/obj/structure/flags.dmi', ripped_outline_state, dir)
	if(!flag_icon)
		flag_icon = new(icon, icon_state)
	flag_icon.AddAlphaMask(ripped_outline)
	if(banner_icon)
		flag_icon.Blend(banner_icon, ICON_UNDERLAY)
	icon = flag_icon
	name = "ripped flag"
	desc = "You can't make out anything from the flag's original print. It's ruined."
	ripped = TRUE
	if(rip_linked)
		var/obj/item/stack/material/cloth/C = new(src.loc, flag_size ? 2 : 1)
		if(user)
			user.put_in_hands(C)
	if(rip_linked && linked_flag)
		linked_flag.rip(user, FALSE) // Prevents an infinite ripping loop.

/obj/structure/sign/flag/attackby(obj/item/attacking_item, mob/user)
	..()
	if(attacking_item.isFlameSource())
		visible_message(SPAN_WARNING("\The [user] starts to burn \the [src] down!"))
		if(!do_after(user, 2 SECONDS, src))
			return FALSE
		visible_message(SPAN_WARNING("\The [user] burns \the [src] down!"))
		playsound(src.loc, 'sound/items/cigs_lighters/zippo_on.ogg', 100, 1)
		new /obj/effect/decal/cleanable/ash(src.loc)
		if(linked_flag)
			qdel(linked_flag)
		qdel(src)
		return TRUE

/obj/structure/sign/flag/proc/toggle()
	set name = "Toggle Banner"
	set category = "Object"
	set src in oview(1)

	if(use_check_and_message(usr))
		return 0

	icon = initial(icon)
	flag_icon = new(icon, icon_state)

	if(!rolled_outline)
		shading_icon = new('icons/obj/structure/flags.dmi', "flag_rolled")
		rolled_outline = new('icons/obj/structure/flags.dmi', "banner_rolled")
		flag_icon.AddAlphaMask(rolled_outline)
	else
		rolled_outline = null
		shading_icon = new('icons/obj/structure/flags.dmi', "flag")

	flag_icon.Blend(shading_icon, ICON_MULTIPLY)
	banner_icon = new('icons/obj/structure/flags.dmi', stand_icon)
	flag_icon.Blend(banner_icon, ICON_UNDERLAY)
	icon = flag_icon

// Flags

/obj/item/flag/blank
	flag_path = "blank"
	flag_structure = /obj/structure/sign/flag/blank

/obj/structure/sign/flag/blank
	flag_path = "flag"
	flag_item = /obj/item/flag/blank
