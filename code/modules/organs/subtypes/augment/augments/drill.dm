/obj/item/organ/internal/augment/tool/drill
	name = "integrated drill"
	icon_state = "drill"
	action_button_name = "Deploy Drill"
	action_button_icon = "drill"
	parent_organ = BP_R_HAND
	organ_tag = BP_AUG_DRILL
	augment_type = /obj/item/pickaxe/drill/integrated

/obj/item/organ/internal/augment/tool/drill/left
	parent_organ = BP_L_HAND
	aug_slot = slot_l_hand

/obj/item/pickaxe/drill/integrated
	name = "integrated mining drill"
	desc = "A integrated mining drill that is installed on the hand of the user, it can retract at the user's command."
	icon_state = "integrateddrill"
	item_state = "integrateddrill"

/obj/item/pickaxe/drill/integrated/throw_at()
	usr.drop_from_inventory(src)

/obj/item/pickaxe/drill/integrated/dropped()
	. = ..()
	loc = null
	qdel(src)
