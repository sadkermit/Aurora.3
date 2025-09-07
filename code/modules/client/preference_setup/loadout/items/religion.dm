ABSTRACT_TYPE(/datum/gear/religion)
	sort_category = "Religion"
	flags = GEAR_HAS_DESC_SELECTION

/datum/gear/religion/rosary
	display_name = "rosary"
	path = /obj/item/clothing/accessory/rosary
	slot = slot_tie

/datum/gear/religion/scapular
	display_name = "scapular"
	path = /obj/item/clothing/accessory/scapular
	slot = slot_tie

/datum/gear/religion/crucifix
	display_name = "crucifix selection"
	description = "A selection of different crucifixes, commonly associated with Christianity."
	path = /obj/item/clothing/accessory/crucifix
	slot = slot_tie
	flags = GEAR_HAS_DESC_SELECTION | GEAR_HAS_NAME_SELECTION

/datum/gear/religion/crucifix/New()
	..()
	var/list/crucifix = list()
	crucifix["gold crucifix"] = /obj/item/clothing/accessory/crucifix/gold
	crucifix["silver crucifix"] = /obj/item/clothing/accessory/crucifix/silver
	crucifix["gold saint peter crucifix"] = /obj/item/clothing/accessory/crucifix/gold/saint_peter
	crucifix["silver saint peter crucifix"] = /obj/item/clothing/accessory/crucifix/silver/saint_peter
	gear_tweaks += new /datum/gear_tweak/path(crucifix)

/datum/gear/religion/shintorobe
	display_name = "shrine maiden robe"
	path = /obj/item/clothing/under/konyangdresstraditional/red
	slot = slot_w_uniform

/datum/gear/religion/kippah
	display_name = "kippah"
	description = "A head covering commonly worn by those of Jewish faith."
	path = /obj/item/clothing/head/kippah
	slot = slot_head
	flags = GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/religion/tallit
	display_name = "tallit"
	description = "A prayer shawl commonly worn by those of Jewish faith."
	path = /obj/item/clothing/accessory/tallit
	slot = slot_tie
	flags = GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION
