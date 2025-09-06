/// Aurora custom items ///
/*basic guidelines:
Custom items must be accepted at some point in the forums by the staff handling them.
Add custom items to this file, their sprites into their own dmi. in the icons/obj/custom_items.
All custom items with worn sprites must follow the contained sprite system: http://forums.aurorastation.org/viewtopic.php?f=23&t=6798
*/

// Put /custom_item/ parents here, please.
/obj/item/custom_item

/obj/item/organ/internal/augment/custom_item

/obj/item/implanter/custom_item //snowflake implanters for snowflakes
	var/allowed_ckey = ""
	var/implant_type = null

/obj/item/implanter/custom_item/proc/create_implant()
	if (!implant_type)
		return
	imp = new implant_type(src)
	update_icon()

	return

/obj/item/clothing/gloves/custom_item

/obj/item/clothing/head/custom_item

/obj/item/clothing/accessory/holster/thigh/custom_item
