/datum/species/monkey
	name = SPECIES_MONKEY
	short_name = "mon"
	name_plural = "Monkeys"
	blurb = "Ook."

	icobase = 'icons/mob/human_races/monkeys/r_monkey.dmi'
	deform = 'icons/mob/human_races/monkeys/r_monkey.dmi'
	skeleton_icon = 'icons/mob/human_races/monkeys/monkey_skeleton.dmi'
	damage_overlays = 'icons/mob/human_races/masks/dam_monkey.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_monkey.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_monkey.dmi'
	language = LANGUAGE_CHIMPANZEE
	default_language = LANGUAGE_CHIMPANZEE
	secondary_langs = list(LANGUAGE_CHIMPANZEE)
	greater_form = SPECIES_HUMAN
	mob_size = MOB_SMALL
	show_ssd = null

	bodytype = BODYTYPE_MONKEY
	species_height = HEIGHT_CLASS_TINY

	eyes = "blank_eyes"

	gibbed_anim = "gibbed-m"

	death_message = "lets out a faint chimper as it collapses and stops moving..."
	death_message_range = 7

	tail = "chimptail"

	unarmed_types = list(/datum/unarmed_attack/bite, /datum/unarmed_attack/claws)
	inherent_verbs = list(/mob/living/proc/ventcrawl, /mob/living/carbon/human/proc/change_animal_name)
	hud_type = /datum/hud_data/monkey

	meat_type = /obj/item/reagent_containers/food/snacks/meat/monkey

	rarity_value = 0.1
	total_health = 75
	brute_mod = 1.5
	burn_mod = 1.5
	fall_mod = 0.5
	grab_mod = 1.25
	resist_mod = 0.25
	natural_climbing = 1

	spawn_flags = IS_RESTRICTED

	bump_flag = MONKEY
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL|ALIEN

	pass_flags = PASSTABLE
	holder_type = /obj/item/holder/monkey

/datum/species/monkey/handle_npc(var/mob/living/carbon/human/H)
	if(H.stat != CONSCIOUS)
		return

	if(prob(33) && H.canmove && isturf(H.loc) && !H.pulledby) //won't move if being pulled
		step(H, pick(GLOB.cardinals))

	if(prob(1))
		H.emote(pick("scratch","jump","roll","tail"))

	if(H.get_shock() && H.shock_stage < 40 && prob(3))
		H.custom_emote(AUDIBLE_MESSAGE, "chimpers pitifully")

	if(H.shock_stage > 10 && prob(3))
		H.emote(pick("cry","whimper"))

	if(H.shock_stage >= 40 && prob(3))
		H.emote("scream")

	if(!H.restrained() && H.lying && H.shock_stage >= 60 && prob(3))
		H.custom_emote(AUDIBLE_MESSAGE, "thrashes in agony")

/datum/species/monkey/New()
	..()
	equip_adjust = list(
		slot_l_hand_str =    list("[NORTH]" = list("x" = 1, "y" = 2),  "[EAST]" = list("x" = -3, "y" = 1), "[SOUTH]" = list("x" = -2, "y" = 2), "[WEST]" = list("x" = 3, "y" = 2)),
		slot_r_hand_str =    list("[NORTH]" = list("x" = -1, "y" = 2), "[EAST]" = list("x" = -2, "y" = 2), "[SOUTH]" = list("x" = 2, "y" = 2),  "[WEST]" = list("x" = 2, "y" = 2)),
		slot_head_str =      list("[NORTH]" = list("x" = 0, "y" = 0),  "[EAST]" = list("x" = -2, "y" = 0), "[SOUTH]" = list("x" = 0, "y" = 0),  "[WEST]" = list("x" = 2, "y" = 0)),
		slot_wear_mask_str = list("[NORTH]" = list("x" = 0, "y" = 0),  "[EAST]" = list("x" = -1, "y" = 0), "[SOUTH]" = list("x" = 0, "y" = 0),  "[WEST]" = list("x" = 1, "y" = 0))
	)

/datum/species/monkey/get_random_name()
	return "[lowertext(name)] ([rand(100,999)])"
