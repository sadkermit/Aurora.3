/obj/item/organ/internal/augment/tool/combitool
	name = "retractable combitool"
	icon_state = "augment-tool"
	action_button_name = "Deploy Combitool"
	action_button_icon = "augment-tool"
	parent_organ = BP_R_HAND
	organ_tag = BP_AUG_TOOL
	augment_type = /obj/item/combitool/robotic

/obj/item/organ/internal/augment/tool/combitool/left
	parent_organ = BP_L_HAND
	aug_slot = slot_l_hand

/obj/item/combitool/robotic
	name = "robotic combitool"
	desc = "An integrated combitool module."
	icon_state = "digitool"
	item_state = "digitool"
	w_class = WEIGHT_CLASS_BULKY
	tools = list(
		"crowbar",
		"screwdriver",
		"wrench",
		"wirecutters"
		)

/obj/item/combitool/robotic/throw_at()
	usr.drop_from_inventory(src)

/obj/item/combitool/robotic/dropped()
	. = ..()
	loc = null
	qdel(src)
