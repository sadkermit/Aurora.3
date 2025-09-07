/obj/item/clothing/suit/armor/carrier
	name = "plate carrier"
	desc = "A plate carrier that can be decked out with various armor plates and accessories."
	icon = 'icons/obj/item/clothing/suit/armor/modular_armor/modular_armor.dmi'
	contained_sprite = TRUE
	icon_state = "plate_carrier"
	item_state = "plate_carrier"
	blood_overlay_type = "armor"
	w_class = WEIGHT_CLASS_NORMAL
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_PLATE, ACCESSORY_SLOT_ARM_GUARDS, ACCESSORY_SLOT_LEG_GUARDS, ACCESSORY_SLOT_ARMOR_POCKETS)
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_PLATE, ACCESSORY_SLOT_ARM_GUARDS, ACCESSORY_SLOT_LEG_GUARDS, ACCESSORY_SLOT_ARMOR_POCKETS, ACCESSORY_SLOT_GENERIC, ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_CAPE, ACCESSORY_SLOT_UTILITY_MINOR)
	pockets = null

/obj/item/clothing/suit/armor/carrier/officer
	starting_accessories = list(
		/obj/item/clothing/accessory/armor_plate,
		/obj/item/clothing/accessory/storage/modular_pouch
	)

/obj/item/clothing/suit/armor/carrier/hos
	starting_accessories = list(
		/obj/item/clothing/accessory/armor_plate,
		/obj/item/clothing/accessory/storage/modular_pouch/large,
		/obj/item/clothing/accessory/sec_commander_stripes
	)

/obj/item/clothing/suit/armor/carrier/generic
	starting_accessories = list(
		/obj/item/clothing/accessory/armor_plate/generic,
		/obj/item/clothing/accessory/storage/modular_pouch
	)

/obj/item/clothing/suit/armor/carrier/scc
	starting_accessories = list(
		/obj/item/clothing/accessory/armor_plate/scc,
		/obj/item/clothing/accessory/storage/modular_pouch
	)

/obj/item/clothing/suit/armor/carrier/riot
	starting_accessories = list(
		/obj/item/clothing/accessory/armor_plate/riot,
		/obj/item/clothing/accessory/leg_guard/riot,
		/obj/item/clothing/accessory/arm_guard/riot,
		/obj/item/clothing/accessory/storage/modular_pouch
	)

/obj/item/clothing/suit/armor/carrier/ballistic
	starting_accessories = list(
		/obj/item/clothing/accessory/armor_plate/ballistic,
		/obj/item/clothing/accessory/leg_guard/ballistic,
		/obj/item/clothing/accessory/arm_guard/ballistic,
		/obj/item/clothing/accessory/storage/modular_pouch/large
	)

/obj/item/clothing/suit/armor/carrier/ablative
	starting_accessories = list(
		/obj/item/clothing/accessory/armor_plate/ablative,
		/obj/item/clothing/accessory/leg_guard/ablative,
		/obj/item/clothing/accessory/arm_guard/ablative,
		/obj/item/clothing/accessory/storage/modular_pouch/large
	)

/obj/item/clothing/suit/armor/carrier/heavy
	starting_accessories = list(
		/obj/item/clothing/accessory/armor_plate/heavy,
		/obj/item/clothing/accessory/leg_guard/heavy,
		/obj/item/clothing/accessory/arm_guard/heavy,
		/obj/item/clothing/accessory/storage/modular_pouch/large
	)

/obj/item/clothing/suit/armor/carrier/heavy/scc
	starting_accessories = list(
		/obj/item/clothing/accessory/armor_plate/heavy/scc,
		/obj/item/clothing/accessory/leg_guard/heavy/scc,
		/obj/item/clothing/accessory/arm_guard/heavy/scc,
		/obj/item/clothing/accessory/storage/modular_pouch/large,
		/obj/item/clothing/accessory/sleevepatch/scc
	)

/obj/item/clothing/suit/armor/carrier/heavy/sec
	starting_accessories = list(
		/obj/item/clothing/accessory/armor_plate/heavy/sec,
		/obj/item/clothing/accessory/leg_guard/heavy/sec,
		/obj/item/clothing/accessory/arm_guard/heavy/sec,
		/obj/item/clothing/accessory/storage/modular_pouch/large
	)

/obj/item/clothing/accessory/armor_plate
	name = "corporate armor plate"
	desc = "A particularly light-weight armor plate in stylish corporate black. Unfortunately, not very good if you hold it with your hands."
	icon = 'icons/obj/item/clothing/suit/armor/modular_armor/modular_armor.dmi'
	icon_state = "plate_sec"
	item_state = "plate_sec"
	contained_sprite = TRUE
	slot = ACCESSORY_SLOT_ARMOR_PLATE
	accessory_layer = ACCESSORY_LAYER_LOWER
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	w_class = WEIGHT_CLASS_NORMAL
	armor = list(
		MELEE = ARMOR_MELEE_KEVLAR,
		BULLET = ARMOR_BALLISTIC_MEDIUM,
		LASER = ARMOR_LASER_KEVLAR,
		ENERGY = ARMOR_ENERGY_SMALL,
		BOMB = ARMOR_BOMB_PADDED
	)

/obj/item/clothing/accessory/armor_plate/mechanics_hints(mob/user, distance, is_adjacent)
	. += ..()
	. += "These must be attached to plate carriers for them to work."

/obj/item/clothing/accessory/armor_plate/before_attached(var/obj/item/clothing/clothing, var/mob/user)
	if(!clothing.valid_accessory_slots || !(slot in clothing.valid_accessory_slots))
		return
	var/obj/item/clothing/accessory/armor_plate/existing_plate = locate() in clothing.accessories
	if(!existing_plate)
		return
	clothing.remove_accessory(user, existing_plate)

/obj/item/clothing/accessory/armor_plate/generic
	name = "standard armor plate"
	desc = "A light-weight kevlar armor plate in drab black colors. A galactic favourite of Zavodskoi fans."
	icon_state = "plate_generic"
	item_state = "plate_generic"

/obj/item/clothing/accessory/armor_plate/scc
	name = "scc armor plate"
	desc = "A light-weight kevlar armor plate in SCC corporate colors. Often issued to untrained personnel, to help with identification."
	icon_state = "plate_blue"
	item_state = "plate_scc"

/obj/item/clothing/accessory/armor_plate/hos
	name = "commander armor plate"
	desc = "A particularly light-weight armor plate with really cool gold bands. Even more stylish when the gold bands are covered in the blood of your goons!"
	icon_state = "plate_sec_commander"
	item_state = "plate_sec_commander"

/obj/item/clothing/accessory/armor_plate/ballistic
	name = "ballistic armor plate"
	desc = "A heavy alloy ballistic armor plate in gunmetal grey. Shockingly stylish, but also shockingly tiring to wear!"
	icon_state = "plate_ballistic"
	item_state = "plate_ballistic"
	armor = list(
		MELEE = ARMOR_MELEE_RESISTANT,
		BULLET = ARMOR_BALLISTIC_RIFLE,
		LASER = ARMOR_LASER_MINOR,
		ENERGY = ARMOR_ENERGY_MINOR,
		BOMB = ARMOR_BOMB_PADDED
	)
	slowdown = 0.4

/obj/item/clothing/accessory/armor_plate/riot
	name = "riot armor plate"
	desc = "A heavily padded riot armor plate. Many Biesellites wish they had these for Black Friday!"
	icon_state = "plate_riot"
	item_state = "plate_riot"
	armor = list(
		MELEE = ARMOR_MELEE_VERY_HIGH,
		BULLET = ARMOR_BALLISTIC_MINOR,
		LASER = ARMOR_LASER_MINOR,
		ENERGY = ARMOR_ENERGY_MINOR,
		BOMB = ARMOR_BOMB_PADDED
	)
	slowdown = 0.4

/obj/item/clothing/accessory/armor_plate/ablative
	name = "ablative armor plate"
	desc = "A heavy ablative armor plate. Shine like a diamond!"
	icon_state = "plate_ablative"
	item_state = "plate_ablative"
	armor = list(
		MELEE = ARMOR_MELEE_MINOR,
		BULLET = ARMOR_BALLISTIC_MINOR,
		LASER = ARMOR_LASER_MAJOR,
		ENERGY = ARMOR_ENERGY_RESISTANT
	)
	slowdown = 0.4
	siemens_coefficient = 0

/obj/item/clothing/accessory/armor_plate/heavy
	name = "heavy armor plate"
	desc = "A heavy and menacing armor plate. Tan armor plates went out of style centuries ago!"
	icon_state = "plate_heavy"
	item_state = "plate_heavy"
	armor = list(
		MELEE = ARMOR_MELEE_MAJOR,
		BULLET = ARMOR_BALLISTIC_MAJOR,
		LASER = ARMOR_LASER_RIFLE,
		ENERGY = ARMOR_ENERGY_SMALL,
		BOMB = ARMOR_BOMB_PADDED,
	)
	slowdown = 0.4

/obj/item/clothing/accessory/armor_plate/heavy/scc
	name = "heavy SCC armor plate"
	desc = "A heavy and nondescript armor plate. You really get the idea they wanted these mooks to be unfeeling."
	icon_state = "plate_blue"
	item_state = "plate_blue"
	slowdown = 0.4

/obj/item/clothing/accessory/armor_plate/press
	name = "press armor plate"
	desc = "A light-weight kevlar armor plate in blue colors and a \"PRESS\" sticker included. Used by wartime correspondents."
	icon_state = "plate_press"
	item_state = "plate_press"

/obj/item/clothing/accessory/storage/chestpouch
	name = "chestpouch rig"
	desc = "A harness made to be worn over a set of armor. Comes with three pouches on the front, and a hidden pouch on the back for your snacks!"
	icon = 'icons/obj/item/clothing/suit/armor/modular_armor/modular_armor_attachments.dmi'
	icon_state = "tcaf_chestpouches"
	item_state = "tcaf_chestpouches"
	contained_sprite = TRUE
	slot = ACCESSORY_SLOT_ARMOR_POCKETS
	slots = 4

/obj/item/clothing/accessory/storage/chest_gear
	name = "standard vest equipment"
	desc = "The standard pouch and commlink each Minuteman gets issued out of basic. This one has a bullet wedged in the radio, don't expect it to work anytime soon."
	icon = 'icons/obj/item/clothing/suit/armor/modular_armor/modular_armor_attachments.dmi'
	icon_state = "tcaf_chest_gear"
	item_state = "tcaf_chest_gear"
	contained_sprite = TRUE
	slot = ACCESSORY_SLOT_ARMOR_POCKETS
	slots = 2

/obj/item/clothing/accessory/storage/modular_pouch
	name = "plate carrier pouches"
	desc = "A comfortable set of pouches that can be attached to a plate carrier, allowing the wearer to store some small items."
	icon = 'icons/obj/item/clothing/suit/armor/modular_armor/modular_armor_attachments.dmi'
	icon_state = "modular_pouch"
	item_state = "modular_pouch"
	contained_sprite = TRUE
	slot = ACCESSORY_SLOT_ARMOR_POCKETS
	slots = 2

/obj/item/clothing/accessory/storage/modular_pouch/large
	name = "large plate carrier pouches"
	desc = "A comfortable set of pouches that can be attached to a plate carrier, allowing the wearer to store some small items. This one uses advanced sewing techniques for additional storage capacity."
	icon_state = "modular_pouch_l"
	item_state = "modular_pouch_l"
	slots = 3

/obj/item/clothing/accessory/armor_plate/heavy/sec
	name = "heavy corporate armor plate"
	desc = "A heavy and stylish armor plate with blue highlights. That prevents teamkills, right?"
	icon_state = "plate_sec_heavy"
	item_state = "plate_sec_heavy"
	armor = list(
		MELEE = ARMOR_MELEE_MAJOR,
		BULLET = ARMOR_BALLISTIC_MAJOR,
		LASER = ARMOR_LASER_MEDIUM,
		ENERGY = ARMOR_ENERGY_SMALL,
		BOMB = ARMOR_BOMB_PADDED
	)
	slowdown = 0.4

/obj/item/clothing/head/helmet/security
	name = "corporate helmet"
	desc = "A shiny helmet in corporate black! Goes well with the respective plate carrier."
	icon = 'icons/obj/item/clothing/head/modular_armor_helmets.dmi'
	contained_sprite = TRUE
	icon_state = "helm_sec"
	item_state = "helm_sec"

/obj/item/clothing/head/helmet/security/generic
	name = "standard helmet"
	desc = "A shiny helmet in grey! Goes well with the respective plate carrier."
	icon_state = "helm_generic"
	item_state = "helm_generic"

/obj/item/clothing/head/helmet/security/press
	name = "press helmet"
	desc = "A helmet in blue colors with a prominent \"PRESS\" emblazoned in front. A common sight on journalists in the Wildlands."
	icon_state = "helm_press"
	item_state = "helm_press"

/obj/item/clothing/head/helmet/security/heavy
	name = "corporate heavy helmet"
	desc = "A shiny and heavy helmet in corporate black! Goes well with the respective plate carrier."
	icon_state = "helm_sec_heavy"
	item_state = "helm_sec_heavy"
	armor = list(
		MELEE = ARMOR_MELEE_MAJOR,
		BULLET = ARMOR_BALLISTIC_MAJOR,
		LASER = ARMOR_LASER_MEDIUM,
		ENERGY = ARMOR_ENERGY_SMALL,
		BOMB = ARMOR_BOMB_PADDED,
	)



//Cosmetic Accessories

/obj/item/clothing/accessory/sec_commander_stripes
	name = "head of security stripes"
	desc = "A set of high visibility inserts for use in armour. This one declares the wearer as a Head of Security."
	icon = 'icons/obj/item/clothing/accessory/armor/modular_armor_accessories.dmi'
	icon_state = "sec_commander_stripes"
	item_state = "sec_commander_stripes"
	contained_sprite = TRUE
	slot = ACCESSORY_SLOT_GENERIC
	flippable = FALSE

/obj/item/clothing/accessory/flagpatch
	name = "flagpatch"
	desc = "A simple strip of fabric attached to a vest or helmet typically used to denote the wearer's \
	organization or nationality."
	icon = 'icons/obj/item/clothing/accessory/armor/modular_armor_accessories.dmi'
	icon_state = "flagpatch"
	item_state = "flagpatch"
	var/shading_state = "flagpatch"
	contained_sprite = TRUE
	slot = ACCESSORY_SLOT_GENERIC
	flippable = TRUE

/obj/item/clothing/accessory/flagpatch/flip_message(mob/user)
	to_chat(user, "You change \the [src] to be on your [src.flipped ? "shoulder" : "chest"].")

/obj/item/clothing/accessory/flagpatch/Initialize()
	. = ..()
	var/icon/shading_icon
	var/icon/flagpatch_icon = new(icon, icon_state)
	if(shading_state)
		shading_icon = new(icon, shading_state)
		flagpatch_icon.Blend(shading_icon, ICON_MULTIPLY)
		AddOverlays(flagpatch_icon)

/obj/item/clothing/accessory/flagpatch/rectangular
	shading_state = null

/obj/item/clothing/accessory/flagpatch/triangular
	icon_state = "flagpatch_triangular"
	item_state = "flagpatch_triangular"
	shading_state = null

/obj/item/clothing/accessory/flagpatch/circular
	icon_state = "flagpatch_circular"
	item_state = "flagpatch_circular"
	shading_state = null

/obj/item/clothing/accessory/flagpatch/square
	icon_state = "flagpatch_square"
	item_state = "flagpatch_square"
	shading_state = null
