///Generic damage proc (slimes and monkeys).
/atom/proc/attack_generic(mob/user, damage, attack_message, environment_smash, armor_penetration, attack_flags, damage_type)
	return 0

///Generic click on for pai
/atom/proc/attack_pai(mob/user)
	return

/**
 * Humans:
 * Adds an exception for gloves, to allow special glove types like the ninja ones.
 *
 * Otherwise pretty standard.
 */
/mob/living/carbon/human/UnarmedAttack(var/atom/A, var/proximity)

	if(!..())
		return

	// Special glove functions:
	// If the gloves do anything, have them return 1 to stop
	// normal attack_hand() here.
	var/obj/item/clothing/gloves/G = gloves // not typecast specifically enough in defines
	var/obj/item/clothing/glasses/GS = glasses
	if(istype(G) && G.Touch(A,src,1))
		return

	else if(istype(GS) && GS.Look(A,src,1)) // for goggles
		return

	A.attack_hand(src)

/atom/proc/attack_hand(mob/user)
	return

/atom/proc/attack_ranged(mob/user, params)
	return

/mob/proc/attack_empty_hand(var/bp_hand)
	return

/mob/living/carbon/human/RangedAttack(atom/A)
	var/obj/item/clothing/gloves/GV = gloves
	var/obj/item/clothing/glasses/GS = glasses

	if(istype(GS) && GS.Look(A,src,0)) // for goggles
		return

	if(istype(GV) && GV.Touch(A,src,0)) // for magic gloves
		return

	. = ..()

/mob/living/RestrainedClickOn(var/atom/A)
	return

/*
	Aliens
*/

/mob/living/carbon/alien/RestrainedClickOn(var/atom/A)
	return

/mob/living/carbon/alien/UnarmedAttack(var/atom/A, var/proximity)

	if(!..())
		return 0

	setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	A.attack_generic(src,rand(5,6),"bitten")

/*
	New Players:
	Have no reason to click on anything at all.
*/
/mob/abstract/new_player/ClickOn()
	return

/*
	Animals
*/
/mob/living/simple_animal/UnarmedAttack(var/atom/A, var/proximity)

	if(!..())
		return
	if(istype(A,/mob/living))
		if(melee_damage_upper == 0)
			custom_emote(VISIBLE_MESSAGE,"[friendly] [A]!")
			return
		if(ckey)
			add_logs(src, A, attacktext)
	setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	var/damage = rand(melee_damage_lower, melee_damage_upper)
	if(A.attack_generic(src, damage, attacktext, environment_smash, armor_penetration, attack_flags) && loc && attack_sound)
		playsound(loc, attack_sound, 50, 1, 1)

/mob/living/CtrlClickOn(var/atom/A)
	. = ..()

	if(client && client.hardsuit_click_mode == 2) //HARDSUIT_MODE_CTRL_CLICK
		if(HardsuitClickOn(A))
			return

	if(!. && a_intent == I_GRAB && length(available_maneuvers))
		. = perform_maneuver(prepared_maneuver || available_maneuvers[1], A)
