//Freelancer voidsuit
/obj/item/clothing/head/helmet/space/void/freelancer
	name = "armored voidsuit helmet"
	desc = "A helmet from a commercial combat voidsuit design. Acceptably well-armored and prolific thoughout the Orion Spur, it can be seen in use by everyone from mercenaries to militia groups to police forces."
	icon = 'icons/obj/clothing/voidsuit/mercenary.dmi'
	icon_state = "freelancer_helm"
	item_state = "freelancer_helm"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc")
	armor = list(
		MELEE = ARMOR_MELEE_RESISTANT,
		BULLET = ARMOR_BALLISTIC_MEDIUM,
		LASER = ARMOR_LASER_PISTOL,
		ENERGY = ARMOR_ENERGY_MINOR,
		BOMB = ARMOR_BOMB_PADDED,
		BIO = ARMOR_BIO_SHIELDED,
		RAD = ARMOR_RAD_SMALL
	)
	siemens_coefficient = 0.35
	species_restricted = list(BODYTYPE_HUMAN)
	light_overlay = "freelancer_light"
	brightness_on = 6
	light_color = "#7ffbf7"
	refittable_species = list(BODYTYPE_HUMAN, BODYTYPE_IPC)

/obj/item/clothing/suit/space/void/freelancer
	name = "armored voidsuit"
	desc = "A suit from a commercial combat voidsuit design. Acceptably well-armored and prolific thoughout the Orion Spur, it can be seen in use by everyone from mercenaries to militia groups to police forces."
	icon = 'icons/obj/clothing/voidsuit/mercenary.dmi'
	icon_state = "freelancer"
	item_state = "freelancer"
	contained_sprite = TRUE
	icon_supported_species_tags = list("skr", "taj", "una", "ipc")
	slowdown = 1
	w_class = WEIGHT_CLASS_NORMAL
	armor = list(
		MELEE = ARMOR_MELEE_RESISTANT,
		BULLET = ARMOR_BALLISTIC_MEDIUM,
		LASER = ARMOR_LASER_PISTOL,
		ENERGY = ARMOR_ENERGY_MINOR,
		BOMB = ARMOR_BOMB_PADDED,
		BIO = ARMOR_BIO_SHIELDED,
		RAD = ARMOR_RAD_SMALL
	)
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/melee/energy/sword,/obj/item/handcuffs)
	siemens_coefficient = 0.35
	species_restricted = list(BODYTYPE_HUMAN)
	refittable_species = list(BODYTYPE_HUMAN, BODYTYPE_IPC)
