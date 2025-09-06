/obj/item/organ/internal/eyes
	name = "eyeballs"
	desc = "One could say that picking these up would be a sight to behold. Literally."
	icon_state = "eyes"
	gender = PLURAL
	organ_tag = BP_EYES
	parent_organ = BP_HEAD
	robotic_name = "optical sensors"
	max_damage = 45
	min_broken_damage = 25
	relative_size = 5
	toxin_type = CE_OCULOTOXIC
	var/list/eye_colour = list(0,0,0)
	var/singular_name = "eye"

/obj/item/organ/internal/eyes/proc/update_colour()
	if(!owner)
		return
	eye_colour = list(
		owner.r_eyes ? owner.r_eyes : 0,
		owner.g_eyes ? owner.g_eyes : 0,
		owner.b_eyes ? owner.b_eyes : 0
		)

/obj/item/organ/internal/eyes/proc/change_eye_color()
	set name = "Change Eye Color"
	set desc = "Changes your robotic eye color."
	set category = "IC"
	set src in usr
	if (owner.incapacitated())
		return
	var/new_eyes = input("Please select eye color.", "Eye Color", rgb(owner.r_eyes, owner.g_eyes, owner.b_eyes)) as color|null
	if(new_eyes)
		var/r_eyes = hex2num(copytext(new_eyes, 2, 4))
		var/g_eyes = hex2num(copytext(new_eyes, 4, 6))
		var/b_eyes = hex2num(copytext(new_eyes, 6, 8))
		if(do_after(owner, 0.5 SECONDS, do_flags = DO_USER_CAN_MOVE | DO_USER_CAN_TURN) && owner.change_eye_color(r_eyes, g_eyes, b_eyes))
			owner.update_eyes()
			owner.visible_message(SPAN_NOTICE("[owner] shifts, their eye color changing."),
									SPAN_NOTICE("You shift, your eye color changing."))

/obj/item/organ/internal/eyes/take_damage(amount, var/silent=0)
	var/oldbroken = is_broken()
	. = ..()
	if(is_broken() && !oldbroken && owner && !owner.stat)
		to_chat(owner, SPAN_DANGER("You go blind!"))

/obj/item/organ/internal/eyes/flash_act(intensity = FLASH_PROTECTION_MODERATE, override_blindness_check = FALSE, affect_silicon = FALSE, ignore_inherent = FALSE, type = /atom/movable/screen/fullscreen/flash, length = 2.5 SECONDS)
	var/burnthrough = intensity - owner.get_flash_protection(ignore_inherent)
	if(burnthrough <= 0)
		return

	var/eye_name = (BP_IS_ROBOTIC(src) && robotic_name) ? robotic_name : "eyes"

	if(burnthrough <= 1)
		to_chat(owner, SPAN_WARNING("Your [eye_name] sting a little."))
		owner.eye_blurry = max(owner.eye_blurry, 6)
		take_damage(1, TRUE)
	else if(burnthrough <= 2)
		to_chat(owner, SPAN_WARNING("Your [eye_name] burn!"))
		owner.eye_blurry = max(owner.eye_blurry, rand(6, 12))
		take_damage(rand(2, 3), TRUE)
	else if(burnthrough > 2)
		to_chat(owner, SPAN_DANGER("[FONT_HUGE("Your [eye_name] burn from the intense light of the flash!")]"))
		take_damage(rand(3, 5), TRUE)
		owner.eye_blurry += rand(12, 20)

	if(is_bruised() && !is_broken() && !(owner.disabilities & NEARSIGHTED))
		to_chat(owner, SPAN_DANGER("The intense light is making it harder to see..."))
		owner.disabilities |= NEARSIGHTED
		addtimer(CALLBACK(owner, /mob/proc/remove_nearsighted), 10 SECONDS)

	return TRUE

/obj/item/organ/internal/eyes/process() //Eye damage replaces the old eye_stat var.
	..()
	if(!owner)
		return
	if(is_bruised())
		owner.eye_blurry = 20
	if(is_broken())
		owner.eye_blind = 20

/obj/item/organ/internal/eyes/do_surge_effects()
	if(owner)
		owner.overlay_fullscreen("noise", /atom/movable/screen/fullscreen/flash/noise)

/obj/item/organ/internal/eyes/clear_surge_effects()
	if(owner)
		owner.clear_fullscreen("noise")

/obj/item/organ/internal/eyes/robotize()
	..()
	verbs |= /obj/item/organ/internal/eyes/proc/change_eye_color

/obj/item/organ/internal/eyes/night
	name = "light sensitive eyes"
	desc = "A pair of eyes accustomed to low light conditions."
	icon = 'icons/obj/organs/tajara_organs.dmi'
	action_button_name = "Activate Low Light Vision"
	default_action_type = /datum/action/item_action/organ/night_eyes
	relative_size = 8
	var/night_vision = FALSE
	var/datum/client_color/vision_color = /datum/client_color/monochrome
	var/datum/client_color/vision_mechanical_color = /datum/client_color/monochrome
	var/eye_emote = "'s eyes dilate!"

/obj/item/organ/internal/eyes/night/Destroy()
	disable_night_vision()
	. = ..()

/obj/item/organ/internal/eyes/night/removed(var/mob/living/carbon/human/target)
	. = ..()
	disable_night_vision()

/obj/item/organ/internal/eyes/night/replaced()
	. = ..()
	disable_night_vision()

/obj/item/organ/internal/eyes/night/attack_self(var/mob/user)
	. = ..()
	if(owner.last_special > world.time)
		return

	if(owner.stat || owner.paralysis || owner.stunned || owner.weakened)
		return

	if(is_broken())
		return

	if(!night_vision)
		enable_night_vision()
	else
		disable_night_vision()

	owner.last_special = world.time + 20

/obj/item/organ/internal/eyes/night/take_damage(var/amount, var/silent = 0)
	. = ..()
	disable_night_vision()

/obj/item/organ/internal/eyes/night/take_internal_damage(var/amount, var/silent = 0)
	..()
	disable_night_vision()

/obj/item/organ/internal/eyes/night/flash_act()
	if(!owner)
		return

	. = ..()

	if(. && night_vision)
		to_chat(owner, SPAN_WARNING("Your eyes burn with the intense light of the flash!"))
		owner.Weaken(5)
		disable_night_vision()
		owner.last_special = world.time + 100

/obj/item/organ/internal/eyes/night/proc/can_change_invisible()
	if(owner.client && ((owner.client.view != world.view) || (owner.client.pixel_x != 0) || (owner.client.pixel_y != 0))) //using binoculars
		return FALSE
	if(owner.machine && owner.machine.check_eye(owner) >= 0 && owner.client.eye != owner) //using cameras
		return FALSE
	return TRUE

/obj/item/organ/internal/eyes/night/proc/enable_night_vision()
	if(!owner)
		return
	if(night_vision)
		return
	var/show_message = TRUE
	for(var/obj/item/protection in list(owner.head, owner.wear_mask, owner.glasses))
		if((protection && (protection.body_parts_covered & EYES)))
			show_message = FALSE
			break
	if(show_message && eye_emote)
		owner.visible_message("<b>[owner]</b>[eye_emote]")

	night_vision = TRUE
	if(can_change_invisible())
		owner.set_see_invisible(SEE_INVISIBLE_NOLIGHTING)
	if(status & ORGAN_ROBOT)
		if(vision_mechanical_color)
			owner.add_client_color(vision_mechanical_color)
	else
		if(vision_color)
			owner.add_client_color(vision_color)

/obj/item/organ/internal/eyes/night/proc/disable_night_vision()
	if(!owner)
		return
	if(!night_vision)
		return
	night_vision = FALSE
	if(can_change_invisible())
		owner.set_see_invisible(SEE_INVISIBLE_LIVING)
	if(status & ORGAN_ROBOT)
		if(vision_mechanical_color)
			owner.remove_client_color(vision_mechanical_color)
	else
		if(vision_color)
			owner.remove_client_color(vision_color)
