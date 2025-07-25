/obj/item/gun/launcher
	name = "launcher"
	desc = "A device that launches things."
	w_class = WEIGHT_CLASS_HUGE
	obj_flags =  OBJ_FLAG_CONDUCTABLE
	slot_flags = SLOT_BACK

	var/release_force = 0
	var/throw_distance = 10
	muzzle_flash = 0
	fire_sound_text = "a launcher firing"

/obj/item/gun/launcher/mechanics_hints(mob/user, distance, is_adjacent)
	. += ..()
	. += "This is a projectile launcher, which launches objects such as arrows, rockets, or syringes."
	. += "To fire it, toggle the safety (if one is present) with CTRL-click or by switching to HARM intent, then click where you wish to shoot."
	. += "To reload it, insert the appropriate items."
	. += "Some weapons may require additional drawing of the string or charging, which can typically be done with the Unique-Action macro or button located in the bottom right of the screen."

//This normally uses a proc on projectiles and our ammo is not strictly speaking a projectile.
/obj/item/gun/launcher/can_hit(var/mob/living/target as mob, var/mob/living/user as mob)
	return 1

//Override this to avoid a runtime with suicide handling.
/obj/item/gun/launcher/handle_suicide(mob/living/user)
	to_chat(user, SPAN_WARNING("Shooting yourself with \a [src] is pretty tricky. You can't seem to manage it."))
	return

/obj/item/gun/launcher/proc/update_release_force(obj/item/projectile)
	return 0

/obj/item/gun/launcher/process_projectile(obj/item/projectile, mob/user, atom/target, var/target_zone, var/params=null, var/pointblank=0, var/reflex=0)
	update_release_force(projectile)
	projectile.forceMove(get_turf(user))
	projectile.throw_at(target, throw_distance, release_force, user)
	return 1
