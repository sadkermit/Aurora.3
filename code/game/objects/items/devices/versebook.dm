/obj/item/device/versebook
	name = "\improper versebook"
	desc = "If you see this, someone fucked up. Make a issue request."
	desc_extended = "No, seriously. Make a issue request"
	icon = 'icons/obj/library.dmi'
	icon_state = "dominiabook"
	item_state = "dominia"
	w_class = WEIGHT_CLASS_SMALL
	/// Boolean that prevents reading multiple times
	var/reading = FALSE

	drop_sound = 'sound/items/drop/book.ogg'

	pickup_sound = 'sound/items/pickup/book.ogg'

	/// takes `file2list(FILE.txt)`. Each line in the .txt file is a verse that is randomly selected
	var/list/randomquip = list()

/obj/item/device/versebook/attack_self(mob/user)
	if(!length(randomquip))
		return
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

	if(reading) //So you can't read twice.
		to_chat(user, SPAN_WARNING("You are already reading this book."))
		return
	reading = TRUE //begin reading

	user.visible_message(SPAN_NOTICE("[user] begins to flip through [src]."))
	playsound(loc, 'sound/bureaucracy/bookopen.ogg', 50, 1)

	var/q // recycled from tip of the day code. it just works!(TM)
	q = pick(randomquip)

	if(do_after(user, 2.5 SECONDS))
		to_chat(user, SPAN_NOTICE("You notice a particular verse: [q]"))
	reading = FALSE
