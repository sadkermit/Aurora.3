/obj/item/storage/bag/ore
	name = "mining satchel"
	desc = "This little bugger can be used to store and transport ores."
	icon = 'icons/obj/storage/bags.dmi'
	icon_state = "satchel"
	slot_flags = SLOT_BELT | SLOT_POCKET
	storage_slots = 50
	max_storage_space = 100
	can_hold = list(/obj/item/ore)
	var/obj/structure/ore_box/linked_box

	///The mob we're listening to
	var/mob/listeningTo

/obj/item/storage/bag/ore/mechanics_hints(mob/user, distance, is_adjacent)
	. += ..()
	. += "You can attach a warp extraction pack to it, then click on an ore box that has a warp extraction beacon signaller attached to it to link them. Then ore put into this will be bluespace teleported into the ore box."

/obj/item/storage/bag/ore/Destroy()
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
	listeningTo = null

	linked_box = null
	. = ..()

/obj/item/storage/bag/ore/equipped(mob/user, slot)
	. = ..()
	if(listeningTo == user)
		return
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
	RegisterSignal(user, COMSIG_MOVABLE_MOVED, PROC_REF(pickup_ores))
	listeningTo = user

/obj/item/storage/bag/ore/dropped(mob/user)
	. = ..()
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
		listeningTo = null

/obj/item/storage/bag/ore/proc/pickup_ores(mob/living/user)
	SIGNAL_HANDLER

	var/turf/location = get_turf(user)

	if(location)
		pickup_items_from_loc_and_feedback(user, location, explicit_request = FALSE)

/obj/item/storage/bag/ore/drone
	// this used to be 400. The inventory system FUCKING DIED at this.
	max_storage_space = 200

/obj/item/storage/bag/ore/proc/move_ore_to_ore_box()
	for(var/obj/ore in contents)
		remove_from_storage_deferred(ore, get_turf(src))
		ore.forceMove(linked_box)
