/obj/item/journal
	name = "journal"
	desc = "A journal, kind of like a folder, but bigger! And personal."
	var/closed_desc
	icon = 'icons/obj/library.dmi'
	icon_state = "journal"
	item_state = "journal"
	color = COLOR_DARK_BROWN
	update_icon_on_init = TRUE
	throw_speed = 1
	throw_range = 5
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("bashed", "whacked", "educated")
	drop_sound = 'sound/items/drop/book.ogg'
	pickup_sound = 'sound/items/pickup/book.ogg'

	var/static/list/insertables = list(/obj/item/paper, /obj/item/photo, /obj/item/paper_bundle, /obj/item/sample)

	var/open = FALSE
	var/list/indices

/obj/item/journal/mechanics_hints(mob/user, distance, is_adjacent)
	. += ..()
	. += "ALT-click this while it's on your person or next to you to open this journal."
	. += "While the journal is open, use it in hand or use a pen on it to access the contents."

/obj/item/journal/Destroy()
	for(var/obj/item/folder/embedded/E as anything in indices)
		qdel(E)
	return ..()

/obj/item/journal/update_icon()
	ClearOverlays()
	if(!open)
		icon_state = "[initial(icon_state)]_closed"
		AddOverlays(overlay_image(icon, "closed", flags=RESET_COLOR))
	else if(LAZYLEN(indices))
		icon_state = initial(icon_state)
		AddOverlays(overlay_image(icon, "writing", flags=RESET_COLOR))
	else
		icon_state = initial(icon_state)
		AddOverlays(overlay_image(icon, "blank", flags=RESET_COLOR))

	if(closed_desc)
		desc = open ? initial(desc) + closed_desc : initial(desc)

/obj/item/journal/AltClick(mob/user)
	if(Adjacent(user))
		open = !open
		to_chat(user, SPAN_NOTICE("You [open ? "open" : "close"] \the [src]."))
		update_icon()
		return
	return ..()

/obj/item/journal/attack_self(mob/user)
	if(!open)
		to_chat(user, SPAN_WARNING("You can't look inside \the [src] while it's closed."))
		return
	if(!LAZYLEN(indices))
		to_chat(user, SPAN_WARNING("\The [src] doesn't have anything inside!"))
		return
	var/selected_folder = input(user, "Select an index to view.", "Index View") as null|anything in indices
	if(isnull(selected_folder))
		return
	var/obj/item/folder/embedded/E = indices[selected_folder]
	E.attack_self(user)

/obj/item/journal/attackby(obj/item/attacking_item, mob/user)
	if(is_type_in_list(attacking_item, insertables))
		if(!open)
			to_chat(user, SPAN_WARNING("You can't put anything into \the [src] while it's closed."))
			return
		var/obj/item/folder/embedded/E
		var/list/options = LAZYLEN(indices) ? indices + "New Index" : list("New Index")
		var/selected_folder = tgui_input_list(user, "Select an index to insert this into.", "Index Selection", options)
		if(isnull(selected_folder))
			return
		if(selected_folder == "New Index")
			E = generate_index(user)
		else
			E = indices[selected_folder]
		if(!E)
			return
		user.drop_from_inventory(attacking_item, E)
		to_chat(user, SPAN_NOTICE("You put \the [attacking_item] into \the [E] index in \the [src]."))
		update_icon()
		return
	if(attacking_item.ispen())
		if(!open)
			to_chat(user, SPAN_NOTICE("You open \the [src] with \the [attacking_item]."))
			open = !open
			update_icon()
			return
		attack_self(user)

/obj/item/journal/proc/generate_index(var/mob/user)
	var/obj/item/folder/embedded/E = new /obj/item/folder/embedded(src)
	var/index_name = sanitize(input(user, "Enter the index' name.", "Index Name") as text|null)
	if(!index_name)
		qdel(E)
		return null
	if(index_name == "New Index" || LAZYISIN(indices, index_name))
		index_name = "Index ([length(indices) + 1])"
	E.name = index_name
	LAZYSET(indices, E.name, E)
	RegisterSignal(E, COMSIG_QDELETING, PROC_REF(remove_index))
	return E

/obj/item/journal/proc/remove_index(var/obj/item/folder/embedded/E)
	LAZYREMOVE(indices, E.name)
	update_icon()

/obj/item/journal/notepad
	name = "notepad"
	desc = "A notepad for jotting down notes in meetings or interrogations."

	icon = 'icons/obj/library.dmi'
	icon_state = "notepad"
	item_state = "notepad"
	color = COLOR_DARK_BROWN
	update_icon_on_init = TRUE
	throw_speed = 1
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("bashed", "whacked", "educated")
	drop_sound = 'sound/items/drop/book.ogg'
	pickup_sound = 'sound/items/pickup/book.ogg'

/obj/item/journal/notepad/update_icon()
	ClearOverlays()
	if(!open)
		icon_state = "[initial(icon_state)]_closed"
		AddOverlays(overlay_image(icon, "notepad_paper_closed", flags=RESET_COLOR))
	else if(LAZYLEN(indices))
		icon_state = initial(icon_state)
		AddOverlays(overlay_image(icon, "notepad_writing", flags=RESET_COLOR))
	else
		icon_state = initial(icon_state)
		AddOverlays(overlay_image(icon, "notepad_blank", flags=RESET_COLOR))

	if(closed_desc)
		desc = open ? initial(desc) + closed_desc : initial(desc)

/obj/item/journal/notepad/scc
	name = "scc notepad"
	desc = "A notepad for jotting down notes in corporate meetings. This one is navy blue with a gold SCC logo on the front."
	icon_state = "notepad_scc"
	item_state = "notepad_scc"
	color = COLOR_WHITE
