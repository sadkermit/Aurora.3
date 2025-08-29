ABSTRACT_TYPE(/datum/gear/religion)
	sort_category = "Religion"
	flags = GEAR_HAS_DESC_SELECTION

ABSTRACT_TYPE(/datum/gear/religion/trinary)
	religion = RELIGION_TRINARY

/datum/gear/religion/trinary/mask
	display_name = "trinary perfection mask"
	path = /obj/item/clothing/mask/trinary_mask
	slot = slot_wear_mask

/datum/gear/religion/trinary/coif
	display_name = "trinary perfection coif"
	path = /obj/item/clothing/head/trinary
	slot = slot_head

/datum/gear/religion/trinary/robe
	display_name = "trinary perfection robes selection"
	description = "A selection of robes worn by adherents of the Trinary Perfection."
	path = /obj/item/clothing/suit/trinary_robes
	slot = slot_wear_suit

/datum/gear/religion/trinary/robe/New()
	..()
	var/list/trinaryrobe = list()
	trinaryrobe["trinary perfection robes"] = /obj/item/clothing/suit/trinary_robes
	trinaryrobe["trinary perfection habit"] = /obj/item/clothing/suit/trinary_robes/habit
	trinaryrobe["templeist robes"] = /obj/item/clothing/suit/trinary_robes/templeist
	gear_tweaks += new /datum/gear_tweak/path(trinaryrobe)

/datum/gear/religion/trinary/cape
	display_name = "trinary perfection cape selection"
	description = "A selection of capes worn by adherents to the Trinary Perfection."
	path = /obj/item/clothing/accessory/poncho/trinary
	slot = slot_wear_suit

/datum/gear/religion/trinary/cape/New()
	..()
	var/list/trinarycape = list()
	trinarycape["trinary perfection cape"] = /obj/item/clothing/accessory/poncho/trinary
	trinarycape["trinary perfection shoulder cape"] = /obj/item/clothing/accessory/poncho/trinary/shouldercape
	trinarycape["trinary perfection pellegrina"] = /obj/item/clothing/accessory/poncho/trinary/pellegrina
	gear_tweaks += new /datum/gear_tweak/path(trinarycape)

/datum/gear/religion/trinary/badge
	display_name = "trinary perfection brooch"
	path = /obj/item/clothing/accessory/badge/trinary
	slot = slot_tie

/datum/gear/religion/trinary/book
	display_name = "The Order"
	description = "The holy text of the Trinary Perfection."
	path = /obj/item/device/versebook/trinary

/datum/gear/religion/trinary/book/temple
	display_name = "The Voice of Temple"
	description = "A supplementary holy text belonging to the Lodge of Temple Architect, an order within the Trinary Perfection."
	path = /obj/item/device/versebook/templeist

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
