/datum/gear/uniform/offworlder
	display_name = "CR suit"
	path = /obj/item/clothing/under/offworlder
	whitelisted = list(SPECIES_HUMAN_OFFWORLD)
	sort_category = "Xenowear - Human"
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/offworlder/dress
	display_name = "CR dress"
	path = /obj/item/clothing/under/dress/offworlder

/datum/gear/uniform/offworlder/skirt
	display_name = "CR skirt"
	path = /obj/item/clothing/under/dress/offworlder/skirt

/datum/gear/eyes/starshades
	display_name = "starshades"
	path = /obj/item/clothing/glasses/spiffygogs/offworlder
	whitelisted = list(SPECIES_HUMAN_OFFWORLD)
	sort_category = "Xenowear - Human"
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION
	allowed_roles = list("Chief Engineer", "Engineer", "Atmospheric Technician", "Engineering Apprentice", "Machinist", "Engineering Personnel")

/datum/gear/accessory/offworlder
	display_name = "legbrace"
	path = /obj/item/clothing/accessory/offworlder/bracer
	whitelisted = list(SPECIES_HUMAN_OFFWORLD)
	sort_category = "Xenowear - Human"
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/accessory/offworlder/venter
	display_name = "venter assembly"
	path = /obj/item/clothing/accessory/offworlder

/datum/gear/accessory/offworlder/neckbrace
	display_name = "neckbrace"
	path = /obj/item/clothing/accessory/offworlder/bracer/neckbrace

/datum/gear/accessory/offworlder_armband
	display_name = "exo-stellar ribbon selection"
	path = /obj/item/clothing/accessory/armband/offworlder
	whitelisted = list(SPECIES_HUMAN_OFFWORLD)
	sort_category = "Xenowear - Human"

/datum/gear/accessory/offworlder_armband/New()
	..()
	var/list/armbands = list()
	armbands["science exo-stellar ribbon"] = /obj/item/clothing/accessory/armband/offworlder
	armbands["engineering exo-stellar ribbon"] = /obj/item/clothing/accessory/armband/offworlder/engineering
	armbands["medical exo-stellar ribbon"] = /obj/item/clothing/accessory/armband/offworlder/medical
	gear_tweaks += new /datum/gear_tweak/path(armbands)

/datum/gear/mask/offworlder
	display_name = "jagmask"
	path = /obj/item/clothing/mask/breath/offworlder/jagmask
	whitelisted = list(SPECIES_HUMAN_OFFWORLD)
	sort_category = "Xenowear - Human"

/datum/gear/mask/offworlder/overmask
	display_name = "overmask"
	path = /obj/item/clothing/mask/breath/offworlder
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/mask/offworlder/overmask/veil
	display_name = "starveil"
	path = /obj/item/clothing/mask/offworlder/veil

/datum/gear/mask/offworlder/overmask/scarf
	display_name = "pioneer scarf"
	path = /obj/item/clothing/mask/offworlder
	flags = GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/gloves/offworlder
	display_name = "starmitts"
	path = /obj/item/clothing/gloves/offworlder
	whitelisted = list(SPECIES_HUMAN_OFFWORLD)
	sort_category = "Xenowear - Human"
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/offworlder_rig
	display_name = "exo-stellar skeleton"
	path = /obj/item/rig/light/offworlder
	whitelisted = list(SPECIES_HUMAN_OFFWORLD)
	sort_category = "Xenowear - Human"

/datum/gear/offworlder_rig/colorable
	display_name = "colorable exo-stellar skeleton"
	path = /obj/item/rig/light/offworlder/colorable
	whitelisted = list(SPECIES_HUMAN_OFFWORLD)
	sort_category = "Xenowear - Human"
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/head/human/conical
	display_name = "non la conical hat"
	sort_category = "Xenowear - Human"
	path = /obj/item/clothing/head/nonla

/datum/gear/head/human/fisanduhian_ushanka
	display_name = "fisanduhian ushanka"
	sort_category = "Xenowear - Human"
	path = /obj/item/clothing/head/ushanka/dominia

/datum/gear/head/vysoka
	display_name = "vysokan hat selection"
	description = "A selection of vysokan hats."
	path = /obj/item/clothing/head/vysoka
	flags = GEAR_HAS_DESC_SELECTION
	sort_category = "Xenowear - Human"

/datum/gear/head/vysoka/New()
	..()
	var/list/vysoka = list()
	vysoka["fur cap"] = /obj/item/clothing/head/vysoka
	vysoka["fur cap, purple"] = /obj/item/clothing/head/vysoka/purple
	vysoka["fur cap, blue"] = /obj/item/clothing/head/vysoka/blue
	vysoka["fur cap, red"] = /obj/item/clothing/head/vysoka/red
	vysoka["joku cap"] = /obj/item/clothing/head/vysoka/joku
	vysoka["joku cap, purple"] = /obj/item/clothing/head/vysoka/joku/purple
	vysoka["joku cap, blue"] = /obj/item/clothing/head/vysoka/joku/blue
	vysoka["joku cap, red"] = /obj/item/clothing/head/vysoka/joku/red
	vysoka["hair pin, dainshu feather"] = /obj/item/clothing/head/pin/dainshu
	gear_tweaks += new /datum/gear_tweak/path(vysoka)

