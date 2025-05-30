/obj/item/clothing/mask/muzzle
	name = "muzzle"
	desc = "To stop that awful noise."
	icon_state = "muzzle"
	item_state = "muzzle"
	body_parts_covered = FACE
	w_class = WEIGHT_CLASS_SMALL
	gas_transfer_coefficient = 0.90
	voicechange = 1

/obj/item/clothing/mask/muzzle/tape
	name = "length of tape"
	desc = "It's a robust DIY muzzle!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "tape_cross"
	item_state = null
	w_class = WEIGHT_CLASS_TINY

/obj/item/clothing/mask/muzzle/Initialize()
	. = ..()
	say_messages = list("Mmfph!", "Mmmf mrrfff!", "Mmmf mnnf!")
	say_verbs = list("mumbles", "says")

// Clumsy folks can't take the mask off themselves.
/obj/item/clothing/mask/muzzle/attack_hand(mob/user as mob)
	if(user.wear_mask == src && !user.IsAdvancedToolUser())
		return 0
	..()

/obj/item/clothing/mask/surgical
	name = "surgical mask"
	desc = "A surgical mask designed to help prevent the spread of diseases."
	icon_state = "surgical"
	item_state = "surgical"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = FACE
	item_flags = ITEM_FLAG_FLEXIBLE_MATERIAL
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.01
	armor = list(
		BIO = ARMOR_BIO_RESISTANT
	)
	down_gas_transfer_coefficient = 1
	down_body_parts_covered = null
	adjustable = TRUE

/obj/item/clothing/mask/surgical/w
	desc = "A surgical mask designed to help prevent the spread of diseases. This one's in white."
	icon_state = "surgicalw"
	item_state = "surgicalw"

/obj/item/clothing/mask/cloth
	name = "cloth mask"
	desc = "A colorable cloth mask designed to protect the wearer against allergens, illnesses, and social interaction."
	icon_state = "cloth"
	item_state = "cloth"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = FACE
	item_flags = ITEM_FLAG_FLEXIBLE_MATERIAL
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.01
	armor = list(
		BIO = ARMOR_BIO_MINOR
	)
	down_gas_transfer_coefficient = 1
	down_body_parts_covered = null
	adjustable = TRUE

/obj/item/clothing/mask/dust
	name = "dust mask"
	desc = "A dust mask designed to protect the wearer against construction and/or custodial particulate."
	icon_state = "dust"
	item_state = "dust"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = FACE
	item_flags = ITEM_FLAG_FLEXIBLE_MATERIAL
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.01
	armor = list(
		BIO = ARMOR_BIO_MINOR
	)
	down_gas_transfer_coefficient = 1
	down_body_parts_covered = null
	adjustable = TRUE

/obj/item/clothing/mask/fakemoustache
	name = "fake moustache"
	desc = "Warning: moustache is fake."
	icon_state = "fake-moustache"
	flags_inv = HIDEFACE
	body_parts_covered = 0

/obj/item/clothing/mask/snorkel
	name = "snorkel"
	desc = "For the Swimming Savant."
	icon_state = "snorkel"
	item_state = "snorkel"
	flags_inv = HIDEFACE
	body_parts_covered = 0

/obj/item/clothing/mask/trinary_mask
	name = "trinary perfection mask"
	desc = "A simple lace mask worn by IPCs and organics alike while within the churches of the Trinary Perfection."
	icon_state = "trinary_mask"
	item_state = "trinary_mask"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = FACE
	item_flags = ITEM_FLAG_FLEXIBLE_MATERIAL
	down_body_parts_covered = null
	adjustable = TRUE

/obj/item/clothing/mask/pig
	name = "pig mask"
	desc = "A rubber pig mask."
	icon_state = "pig"
	item_state = "pig"
	flags_inv = HIDEFACE|BLOCKHAIR
	w_class = WEIGHT_CLASS_SMALL
	siemens_coefficient = 0.9
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/horsehead
	name = "horse head mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a horse."
	icon_state = "horsehead"
	item_state = "horsehead"
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EYES
	w_class = WEIGHT_CLASS_SMALL
	siemens_coefficient = 0.9

/obj/item/clothing/mask/horsehead/Initialize()
	. = ..()
	// The horse mask doesn't cause voice changes by default, the wizard spell changes the flag as necessary
	say_messages = list("NEEIIGGGHHHH!", "NEEEIIIIGHH!", "NEIIIGGHH!", "HAAWWWWW!", "HAAAWWW!")
	say_verbs = list("whinnies", "neighs", "says")

/obj/item/clothing/mask/ai
	name = "camera MIU"
	desc = "Allows for direct mental connection to accessible camera networks."
	icon_state = "s-ninja"
	item_state = "s-ninja"
	flags_inv = HIDEFACE
	body_parts_covered = FACE|EYES
	action_button_name = "Toggle MIU"
	origin_tech = list(TECH_DATA = 5, TECH_ENGINEERING = 5)

/obj/item/clothing/mask/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/eye/freelook)

/obj/item/clothing/mask/ai/attack_self(mob/user)
	if(user.incapacitated())
		return
	if(user.get_equipped_item(slot_wear_mask) != src)
		to_chat(user, SPAN_WARNING("You must be wearing \the [src] to activate it!"))
		return
	var/datum/component/eye/freelook/CN = GetComponent(/datum/component/eye/freelook)
	if(!CN)
		to_chat(user, SPAN_WARNING("\The [src] doesn't respond!"))
		return
	if(CN.current_looker)
		CN.unlook()
		to_chat(user, SPAN_NOTICE("You deactivate \the [src]."))
	else
		CN.look(user)
		to_chat(user, SPAN_NOTICE("You activate \the [src]."))

/obj/item/clothing/mask/offworlder
	name = "scarab scarf"
	desc = "Usually a treasured item, these spider-silk scarves are seen passed down by generations of Scarabs."
	desc_extended = "Scarves like these are passed down from family members in the Scarab fleets as a coming of age ritual, typically given to children to mark them as worthy of setting off on their own."
	icon = 'icons/obj/item/clothing/accessory/offworlder.dmi'
	contained_sprite = TRUE
	icon_state = "pioneer_scarf"
	item_state = "pioneer_scarf"
	item_flags = ITEM_FLAG_FLEXIBLE_MATERIAL
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = FACE

/obj/item/clothing/mask/offworlder/veil
	name = "starveil"
	desc = "A thin holographic veil meant to cover the face, intended to block out light."
	icon_state = "starveil"
	item_state = "starveil"
	down_body_parts_covered = null
	adjustable = TRUE

/obj/item/clothing/mask/snood
	name = "snood"
	desc = "A warm, cozy snood, for keeping your face and neck warm."
	icon = 'icons/obj/item/clothing/mask/snood.dmi'
	icon_state = "snood"
	item_state = "snood"
	contained_sprite = TRUE
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = FACE
	item_flags = ITEM_FLAG_FLEXIBLE_MATERIAL
	gas_transfer_coefficient = 0.90
	permeability_coefficient = 0.5
	armor = list(
		BIO = ARMOR_BIO_MINOR
	)
	down_gas_transfer_coefficient = 1
	down_body_parts_covered = null
	adjustable = TRUE
	icon_auto_adapt = TRUE
	sprite_sheets = list()

/obj/item/clothing/mask/snood/Initialize()
	. = ..()
	if(icon_auto_adapt)
		build_and_apply_species_adaption()
