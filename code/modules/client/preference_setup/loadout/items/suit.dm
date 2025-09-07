// Suit slot
/datum/gear/suit
	display_name = "san colette bridge crew jacket"
	path = /obj/item/clothing/suit/storage/toggle/brown_jacket/scc/sancol
	slot = slot_wear_suit
	sort_category = "Suits and Overwear"
	cost = 1

/datum/gear/suit/colorvest
	display_name = "colorable vest"
	path = /obj/item/clothing/suit/storage/toggle/brown_jacket/sleeveless/colorable
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/suit/leather
	display_name = "jacket selection"
	description = "A selection of jackets."
	path = /obj/item/clothing/suit/storage/toggle/leather_jacket

/datum/gear/suit/leather/New()
	..()
	var/list/jackets = list()
	jackets["bomber jacket"] = /obj/item/clothing/suit/storage/toggle/bomber
	jackets["NanoTrasen black jacket"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/nanotrasen
	jackets["NanoTrasen brown jacket"] = /obj/item/clothing/suit/storage/toggle/brown_jacket/nanotrasen
	jackets["black jacket"] = /obj/item/clothing/suit/storage/toggle/leather_jacket
	jackets["brown jacket"] = /obj/item/clothing/suit/storage/toggle/brown_jacket
	jackets["biker jacket"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/biker
	jackets["cropped leather jacket"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/midriff
	jackets["designer leather jacket"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/designer
	jackets["designer leather jacket, black"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/designer/black
	jackets["designer leather jacket, red"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/designer/red
	jackets["flight jacket"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/flight
	jackets["flight jacket, green"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/flight/green
	jackets["flight jacket, white"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/flight/white
	jackets["military jacket"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/military
	jackets["military jacket, tan"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/military/tan
	jackets["old military jacket"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/military/old
	jackets["old military jacket, badge"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/military/old/alt
	jackets["flannel jacket, green"] = /obj/item/clothing/suit/storage/toggle/flannel
	jackets["flannel jacket, red"] = /obj/item/clothing/suit/storage/toggle/flannel/red
	jackets["flannel jacket, blue"] = /obj/item/clothing/suit/storage/toggle/flannel/blue
	jackets["flannel jacket, grey"] = /obj/item/clothing/suit/storage/toggle/flannel/gray
	jackets["flannel jacket, purple"] = /obj/item/clothing/suit/storage/toggle/flannel/purple
	jackets["flannel jacket, yellow"] = /obj/item/clothing/suit/storage/toggle/flannel/yellow
	jackets["high visibility jacket"] = /obj/item/clothing/suit/storage/toggle/highvis
	jackets["high visibility jacket, alt"] = /obj/item/clothing/suit/storage/toggle/highvis_alt
	jackets["high visibility jacket, red"] = /obj/item/clothing/suit/storage/toggle/highvis_red
	jackets["high visibility jacket, orange"] = /obj/item/clothing/suit/storage/toggle/highvis_orange
	jackets["black vest"] = /obj/item/clothing/suit/storage/toggle/leather_vest
	jackets["brown vest"] = /obj/item/clothing/suit/storage/toggle/brown_jacket/sleeveless
	jackets["leather coat"] = /obj/item/clothing/suit/storage/leathercoat
	jackets["puffer jacket"] = /obj/item/clothing/suit/jacket/puffer
	jackets["puffer vest"] = /obj/item/clothing/suit/jacket/puffer/vest

	gear_tweaks += new /datum/gear_tweak/path(jackets)

/datum/gear/suit/hazard_vest
	display_name = "hazard vest selection"
	path = /obj/item/clothing/suit/storage/hazardvest

/datum/gear/suit/hazard_vest/New()
	..()
	var/list/hazard = list()
	hazard["hazard vest, orange"] = /obj/item/clothing/suit/storage/hazardvest
	hazard["hazard vest, white"] = /obj/item/clothing/suit/storage/hazardvest/white
	hazard["hazard vest, nanotrasen navy blue"] = /obj/item/clothing/suit/storage/hazardvest/nblue
	hazard["hazard vest, zavodskoi red"] = /obj/item/clothing/suit/storage/hazardvest/red
	hazard["hazard vest, zeng-hu purple"] = /obj/item/clothing/suit/storage/hazardvest/purple
	hazard["hazard vest, PMCG blue"] = /obj/item/clothing/suit/storage/hazardvest/blue
	hazard["hazard vest, idris teal"] = /obj/item/clothing/suit/storage/hazardvest/teal
	hazard["hazard vest, hephaestus green"] = /obj/item/clothing/suit/storage/hazardvest/green
	gear_tweaks += new /datum/gear_tweak/path(hazard)

/datum/gear/suit/hoodie
	display_name = "hoodie selection"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/hoodie
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/suit/hoodie/New()
	..()
	var/list/l_hoodie = list()
	l_hoodie["hoodie"] = /obj/item/clothing/suit/storage/hooded/wintercoat/hoodie
	l_hoodie["short-sleeved hoodie"] = /obj/item/clothing/suit/storage/hooded/wintercoat/hoodie/short
	l_hoodie["crop top hoodie"] = /obj/item/clothing/suit/storage/hooded/wintercoat/hoodie/crop
	l_hoodie["sleeveless hoodie"] = /obj/item/clothing/suit/storage/hooded/wintercoat/hoodie/sleeveless
	l_hoodie["sleeveless crop top hoodie"] = /obj/item/clothing/suit/storage/hooded/wintercoat/hoodie/sleeveless_crop
	gear_tweaks += new /datum/gear_tweak/path(l_hoodie)

/datum/gear/suit/mars
	display_name = "martian hoodie"
	description = "An orange hoodie, typically worn in solidarity with Mars' recent misfortunes."
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/mars

/datum/gear/suit/labcoat
	display_name = "labcoat selection"
	description = "A selection of recolourable labcoats."
	path = /obj/item/clothing/suit/storage/toggle/labcoat
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION | GEAR_HAS_ACCENT_COLOR_SELECTION

/datum/gear/suit/labcoat/New()
	..()
	var/list/labcoats = list()
	labcoats["plain labcoat"] = /obj/item/clothing/suit/storage/toggle/labcoat
	labcoats["accent labcoat"] = /obj/item/clothing/suit/storage/toggle/labcoat/accent
	labcoats["accent labcoat, alt"] = /obj/item/clothing/suit/storage/toggle/labcoat/accent/alt
	labcoats["long labcoat"] = /obj/item/clothing/suit/storage/toggle/longcoat
	gear_tweaks += new /datum/gear_tweak/path(labcoats)

/datum/gear/suit/cmo_labcoats
	display_name = "chief medical officer labcoats selection"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/cmo
	allowed_roles = list("Chief Medical Officer")
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION

/datum/gear/suit/cmo_labcoats/New()
	..()
	var/list/cmo_labcoats = list()
	cmo_labcoats["chief medical officer labcoat"] = /obj/item/clothing/suit/storage/toggle/labcoat/cmo
	cmo_labcoats["chief medical officer labcoat, alt"] = /obj/item/clothing/suit/storage/toggle/labcoat/cmoalt
	cmo_labcoats["chief medical officer labcoat, alt 2"] = /obj/item/clothing/suit/storage/toggle/labcoat/cmoalt2
	gear_tweaks += new /datum/gear_tweak/path(cmo_labcoats)

/datum/gear/suit/surgeryapron
	display_name = "surgical apron"
	path = /obj/item/clothing/accessory/apron/surgery
	cost = 1
	allowed_roles = list("Scientist", "Chief Medical Officer", "Physician", "Surgeon", "Pharmacist", "Paramedic", "Medical Intern", "Xenobiologist", "Research Director", "Investigator", "Medical Personnel", "Science Personnel")

/datum/gear/suit/surgicalgown
	display_name = "surgical gown selection"
	description = "A selection of corporate surgical gowns."
	path = /obj/item/clothing/suit/storage/surgical_gown/nt
	cost = 1
	allowed_roles = list("Scientist", "Chief Medical Officer", "Physician", "Surgeon", "Pharmacist", "Paramedic", "Medical Intern", "Xenobiologist", "Research Director", "Investigator", "Medical Personnel", "Science Personnel")
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION

/datum/gear/suit/surgicalgown/New()
	..()
	var/list/surgical_gowns = list()
	surgical_gowns["surgical gown, nanotrasen"] = /obj/item/clothing/suit/storage/surgical_gown/nt
	surgical_gowns["surgical gown, zeng-hu"] = /obj/item/clothing/suit/storage/surgical_gown/zeng
	surgical_gowns["surgical gown, pmcg"] = /obj/item/clothing/suit/storage/surgical_gown/pmc
	surgical_gowns["surgical gown, pmcg, alternate"] = /obj/item/clothing/suit/storage/surgical_gown/pmc/alt
	surgical_gowns["surgical gown, zavodskoi"] = /obj/item/clothing/suit/storage/surgical_gown/zavod
	surgical_gowns["surgical gown, idris"] = /obj/item/clothing/suit/storage/surgical_gown/idris
	gear_tweaks += new /datum/gear_tweak/path(surgical_gowns)

/datum/gear/suit/surgicalgown_colorable
	display_name = "surgical gown, colorable"
	description = "A customizable surgical gown."
	path = /obj/item/clothing/suit/storage/surgical_gown
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION | GEAR_HAS_ACCENT_COLOR_SELECTION

/datum/gear/suit/surgicalgown_colorable/New()
	..()
	var/list/surgical_gowns_colorable = list()
	surgical_gowns_colorable["surgical gown, colorable"] = /obj/item/clothing/suit/storage/surgical_gown
	surgical_gowns_colorable["surgical gown, accented"] = /obj/item/clothing/suit/storage/surgical_gown/accent
	gear_tweaks += new /datum/gear_tweak/path(surgical_gowns_colorable)

/datum/gear/suit/medical_outerwear
	display_name = "medical outerwear (jackets, vests, rigs)"
	path = /obj/item/clothing/suit/storage/toggle/para_jacket
	allowed_roles = list("Chief Medical Officer", "Physician", "Surgeon", "Pharmacist", "Paramedic", "Medical Intern", "Medical Personnel")

/datum/gear/suit/medical_outerwear/New()
	..()
	var/list/medical_outerwear = list()
	medical_outerwear["medical chest-rig"] = /obj/item/clothing/suit/storage/medical_chest_rig
	medical_outerwear["paramedic jacket"] = /obj/item/clothing/suit/storage/toggle/para_jacket
	gear_tweaks += new /datum/gear_tweak/path(medical_outerwear)

/datum/gear/suit/poncho
	display_name = "poncho selection"
	path = /obj/item/clothing/accessory/poncho
	cost = 1

/datum/gear/suit/poncho/New()
	..()
	var/list/poncho = list()
	poncho["poncho, tan"] = /obj/item/clothing/accessory/poncho
	poncho["poncho, blue"] = /obj/item/clothing/accessory/poncho/blue
	poncho["poncho, green"] = /obj/item/clothing/accessory/poncho/green
	poncho["poncho, purple"] = /obj/item/clothing/accessory/poncho/purple
	poncho["poncho, red"] = /obj/item/clothing/accessory/poncho/red
	poncho["poncho, medical"] = /obj/item/clothing/accessory/poncho/roles/medical
	poncho["poncho, IAC"] = /obj/item/clothing/accessory/poncho/roles/iac
	poncho["poncho, engineering"] = /obj/item/clothing/accessory/poncho/roles/engineering
	poncho["poncho, science"] = /obj/item/clothing/accessory/poncho/roles/science
	poncho["poncho, operations"] = /obj/item/clothing/accessory/poncho/roles/cargo
	gear_tweaks += new /datum/gear_tweak/path(poncho)

/datum/gear/suit/poncho_colorable
	display_name = "poncho selection, colourable"
	path = /obj/item/clothing/accessory/poncho/colorable
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION | GEAR_HAS_ACCENT_COLOR_SELECTION

/datum/gear/suit/poncho_colorable/New()
	..()
	var/list/col_poncho = list()
	col_poncho["poncho"] = /obj/item/clothing/accessory/poncho/colorable
	col_poncho["poncho, alt"] = /obj/item/clothing/accessory/poncho/colorable/alt
	col_poncho["poncho, gradient"] = /obj/item/clothing/accessory/poncho/colorable/gradient
	gear_tweaks += new /datum/gear_tweak/path(col_poncho)

/datum/gear/suit/suitjacket
	display_name = "suit jacket"
	path = /obj/item/clothing/suit/storage/toggle/suitjacket
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION | GEAR_HAS_ACCENT_COLOR_SELECTION

/datum/gear/suit/blazer
	display_name = "blazer selection"
	path = /obj/item/clothing/suit/storage/toggle/suitjacket/blazer
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION | GEAR_HAS_ACCENT_COLOR_SELECTION

/datum/gear/suit/blazer/New()
	..()
	var/list/blazers = list()
	blazers["blazer"] = /obj/item/clothing/suit/storage/toggle/suitjacket/blazer
	blazers["long blazer"] = /obj/item/clothing/suit/storage/toggle/suitjacket/blazer/long
	gear_tweaks += new /datum/gear_tweak/path(blazers)

/datum/gear/suit/trenchcoats
	display_name = "trenchcoat selection"
	description = "A selection of trenchcoats."
	path = /obj/item/clothing/suit/storage/toggle/trench

/datum/gear/suit/trenchcoats/New()
	..()
	var/list/coat = list()
	coat["trenchcoat, brown"] = /obj/item/clothing/suit/storage/toggle/trench
	coat["trenchcoat, grey"] = /obj/item/clothing/suit/storage/toggle/trench/grey
	coat["trenchcoat, dark brown"] = /obj/item/clothing/suit/storage/toggle/trench/alt
	coat["trenchcoat, grey alternate"] = /obj/item/clothing/suit/storage/toggle/trench/grey_alt
	coat["trenchcoat, green"] = /obj/item/clothing/suit/storage/toggle/trench/green
	coat["brown trenchcoat (Detective)"] = /obj/item/clothing/suit/storage/toggle/trench/det_trench
	coat["black trenchcoat (Detective)"] = /obj/item/clothing/suit/storage/toggle/trench/det_trench/black
	gear_tweaks += new /datum/gear_tweak/path(coat)

/datum/gear/suit/trenchcoat_colorable
	display_name = "colorable trenchcoat selection"
	description = "A sleek canvas trenchcoat in 167,777,216 designer colors."
	path = /obj/item/clothing/suit/storage/toggle/trench/colorable
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION | GEAR_HAS_ACCENT_COLOR_SELECTION

/datum/gear/suit/trenchcoat_colorable/New()
	..()
	var/list/trenches = list()
	trenches["trenchcoat"] = /obj/item/clothing/suit/storage/toggle/trench/colorable
	trenches["trenchcoat, alt"] = /obj/item/clothing/suit/storage/toggle/trench/colorable/alt

	gear_tweaks += new /datum/gear_tweak/path(trenches)

/datum/gear/suit/greatcoats
	display_name = "greatcoat selection"
	description = "A selection of greatcoats."
	path = /obj/item/clothing/suit/storage/toggle/greatcoat
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION

/datum/gear/suit/greatcoats/New()
	..()
	var/list/greatcoat = list()
	greatcoat["greatcoat, black"] = /obj/item/clothing/suit/storage/toggle/greatcoat
	greatcoat["greatcoat, brown"] = /obj/item/clothing/suit/storage/toggle/greatcoat/brown
	gear_tweaks += new /datum/gear_tweak/path(greatcoat)

/datum/gear/suit/ian
	display_name = "worn shirt"
	description = "A worn out, curiously comfortable t-shirt with a picture of Ian."
	path = /obj/item/clothing/suit/ianshirt


/datum/gear/suit/winter
	display_name = "winter coat selection"
	description = "A selection of coats for the thermally challenged."
	path = /obj/item/clothing/suit/storage/hooded/wintercoat

/datum/gear/suit/winter/New()
	..()
	var/list/wintercoat = list()
	wintercoat["winter coat"] = /obj/item/clothing/suit/storage/hooded/wintercoat
	wintercoat["winter coat, red"] = /obj/item/clothing/suit/storage/hooded/wintercoat/red
	wintercoat["winter coat, captain"] = /obj/item/clothing/suit/storage/hooded/wintercoat/captain
	wintercoat["winter coat, security"] = /obj/item/clothing/suit/storage/hooded/wintercoat/security
	wintercoat["winter coat, science"] = /obj/item/clothing/suit/storage/hooded/wintercoat/science
	wintercoat["winter coat, IAC"] = /obj/item/clothing/suit/storage/hooded/wintercoat/iac
	wintercoat["winter coat, medical"] = /obj/item/clothing/suit/storage/hooded/wintercoat/medical
	wintercoat["winter coat, engineering"] = /obj/item/clothing/suit/storage/hooded/wintercoat/engineering
	wintercoat["winter coat, atmospherics"] = /obj/item/clothing/suit/storage/hooded/wintercoat/engineering/atmos
	wintercoat["winter coat, hydroponics"] = /obj/item/clothing/suit/storage/hooded/wintercoat/hydro
	wintercoat["winter coat, operations"] = /obj/item/clothing/suit/storage/hooded/wintercoat/cargo
	wintercoat["winter coat, mining"] = /obj/item/clothing/suit/storage/hooded/wintercoat/miner
	gear_tweaks += new /datum/gear_tweak/path(wintercoat)

/datum/gear/suit/winter_colorable
	display_name = "colorable winter coat"
	description = "A colorable winter coat for the thermally challenged."
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/colorable
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/suit/highloft_colorable
	display_name = "colorable high loft jacket"
	description = "An upper arms and back bands colorable high loft jacket."
	path = /obj/item/clothing/suit/storage/toggle/highloft
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/suit/tcaf
	display_name = "Tau Ceti Armed Forces jacket selection"
	description = "A selection of fine, surplus jackets of the Armed Forces."
	path = /obj/item/clothing/suit/storage/legion
	flags = GEAR_HAS_DESC_SELECTION

/datum/gear/suit/tcaf/New()
	..()
	var/list/tcafjacket = list()
	tcafjacket ["tcaf jacket"] = /obj/item/clothing/suit/storage/legion/tcaf
	tcafjacket ["tcfl jacket"] = /obj/item/clothing/suit/storage/legion
	tcafjacket ["tcfl jacket, flight"] = /obj/item/clothing/suit/storage/toggle/leather_jacket/flight/legion
	gear_tweaks += new /datum/gear_tweak/path(tcafjacket)

/datum/gear/suit/dep_jacket
	display_name = "department jackets selection"
	description = "A selection of departmental jackets."
	path = /obj/item/clothing/suit/storage/toggle/engi_dep_jacket

/datum/gear/suit/dep_jacket/New()
	..()
	var/list/jacket = list()
	jacket["department jacket, engineering"] = /obj/item/clothing/suit/storage/toggle/engi_dep_jacket
	jacket["department jacket, operations"] = /obj/item/clothing/suit/storage/toggle/supply_dep_jacket
	jacket["department jacket, science"] = /obj/item/clothing/suit/storage/toggle/sci_dep_jacket
	jacket["department jacket, medical"] = /obj/item/clothing/suit/storage/toggle/med_dep_jacket
	jacket["department jacket, security"] = /obj/item/clothing/suit/storage/toggle/sec_dep_jacket
	jacket["departmental jacket, service"] = /obj/item/clothing/suit/storage/toggle/serv_dep_jacket
	gear_tweaks += new /datum/gear_tweak/path(jacket)

ABSTRACT_TYPE(/datum/gear/suit/miscellaneous)

/datum/gear/suit/miscellaneous/peacoat
	display_name = "peacoat"
	path = /obj/item/clothing/suit/storage/toggle/peacoat
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/suit/varsity
	display_name = "varsity jacket selection"
	path = /obj/item/clothing/suit/storage/toggle/varsity

/datum/gear/suit/varsity/New()
	..()
	var/list/varsities = list()
	for(var/varsity_style in typesof(/obj/item/clothing/suit/storage/toggle/varsity))
		var/obj/item/clothing/suit/storage/toggle/varsity/varsity = varsity_style
		varsities[initial(varsity.name)] = varsity
	gear_tweaks += new /datum/gear_tweak/path(sortAssoc(varsities))

/datum/gear/suit/track
	display_name = "track jacket selection"
	path = /obj/item/clothing/suit/storage/toggle/track

/datum/gear/suit/track/New()
	..()
	var/list/tracks = list()
	for(var/track_style in typesof(/obj/item/clothing/suit/storage/toggle/track))
		var/obj/item/clothing/suit/storage/toggle/track/track = track_style
		tracks[initial(track.name)] = track
	gear_tweaks += new /datum/gear_tweak/path(sortAssoc(tracks))

/datum/gear/suit/cardigan
	display_name = "cardigan selection"
	description = "A selection of cardigans."
	path = /obj/item/clothing/suit/storage/toggle/cardigan
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/suit/cardigan/New()
	..()
	var/list/cardigan = list()
	cardigan["cardigan"] = /obj/item/clothing/suit/storage/toggle/cardigan
	cardigan["sweater cardigan"] = /obj/item/clothing/suit/storage/toggle/cardigan/sweater
	cardigan["argyle cardigan"] = /obj/item/clothing/suit/storage/toggle/cardigan/argyle
	gear_tweaks += new /datum/gear_tweak/path(cardigan)

/datum/gear/suit/asymmetriccoat
	display_name = "asymmetric coat"
	path = /obj/item/clothing/suit/storage/toggle/asymmetriccoat
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/suit/submariner
	display_name = "submariner jacket"
	path = /obj/item/clothing/suit/storage/toggle/overlay/submariner
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/suit/konyang
	display_name = "konyanger outerwear selection"
	description = "A selection of jackets and coats from the wind-beaten shores of Konyang."
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/konyang
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION

/datum/gear/suit/konyang/New()
	..()
	var/list/konyangcoat = list()
	konyangcoat["konyang village coat"] = /obj/item/clothing/suit/storage/hooded/wintercoat/konyang
	konyangcoat["red konyanger jacket"] = /obj/item/clothing/suit/storage/toggle/konyang
	konyangcoat["red short-sleeved konyanger jacket"] = /obj/item/clothing/suit/storage/toggle/konyang/akira
	konyangcoat["red konyanger jumpjacket"] = /obj/item/clothing/suit/storage/toggle/konyang/pants
	konyangcoat["orange konyanger jumpjacket"] = /obj/item/clothing/suit/storage/toggle/konyang/orange
	konyangcoat["blue konyanger jumpjacket"] = /obj/item/clothing/suit/storage/toggle/konyang/blue
	konyangcoat["biege double-breasted Konyanger jacket"] = /obj/item/clothing/suit/storage/toggle/konyang/dbjacket
	konyangcoat["black double-breasted Konyanger jacket"] = /obj/item/clothing/suit/storage/toggle/konyang/dbjacket/black
	konyangcoat["blue double-breasted Konyanger jacket"] = /obj/item/clothing/suit/storage/toggle/konyang/dbjacket/blue
	gear_tweaks += new /datum/gear_tweak/path(konyangcoat)

// Apron
/datum/gear/suit/apron_colourable
	display_name = "apron (colourable)"
	path = /obj/item/clothing/accessory/apron
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

// Overalls Selection
/datum/gear/suit/overalls
	display_name = "overalls selection (colourable)"
	path = /obj/item/clothing/accessory/overalls
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/suit/overalls/New()
	..()
	var/list/overalls = list()

	// Overalls
	overalls["overalls"] = /obj/item/clothing/accessory/overalls
	overalls["overalls, high back"] = /obj/item/clothing/accessory/overalls/high_back
	overalls["overalls, x-shaped back"] = /obj/item/clothing/accessory/overalls/x_shaped_back

	// Overall Shorts
	overalls["overall shorts"] = /obj/item/clothing/accessory/overalls/shorts
	overalls["overall shorts, high back"] = /obj/item/clothing/accessory/overalls/shorts/high_back
	overalls["overall shorts, x-shaped back"] = /obj/item/clothing/accessory/overalls/shorts/x_shaped_back

	// Overall Skirts
	overalls["overall skirt"] = /obj/item/clothing/accessory/overalls/skirt
	overalls["overall skirt, high back"] = /obj/item/clothing/accessory/overalls/skirt/high_back
	overalls["overall skirt, x-shaped back"] = /obj/item/clothing/accessory/overalls/skirt/x_shaped_back

	gear_tweaks += new /datum/gear_tweak/path(overalls)

/datum/gear/suit/ponczo
	display_name = "visegradi ponczo"
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/colorable/ponczo
	flags = GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION

/datum/gear/suit/patterned_ponczo
	display_name = "visegradi patterned ponczo selection"
	description = "A patterned style of Visegradi ponczo."
	path = /obj/item/clothing/suit/storage/hooded/wintercoat/patterned_ponczo
	flags = GEAR_HAS_DESC_SELECTION

/datum/gear/suit/patterned_ponczo/New()
	..()
	var/list/patterned_ponczo = list()
	patterned_ponczo["red patterned ponczo"] = /obj/item/clothing/suit/storage/hooded/wintercoat/patterned_ponczo
	patterned_ponczo["brown patterned ponczo"] = /obj/item/clothing/suit/storage/hooded/wintercoat/patterned_ponczo/brown
	patterned_ponczo["blue patterned ponczo"] = /obj/item/clothing/suit/storage/hooded/wintercoat/patterned_ponczo/blue
	gear_tweaks += new /datum/gear_tweak/path(patterned_ponczo)

/datum/gear/suit/gentlecoat
	display_name = "gentlemans coat"
	description = "A heavy threaded tweed gray jacket. For a different sort of Gentleman."
	path = /obj/item/clothing/suit/storage/toggle/wizrobe/gentlecoat
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION

/datum/gear/suit/hazard_vest_colorable
	display_name = "colorable hazard vest selection"
	path = /obj/item/clothing/suit/storage/hazardvest/colorable
	flags = GEAR_HAS_NAME_SELECTION | GEAR_HAS_DESC_SELECTION | GEAR_HAS_COLOR_SELECTION | GEAR_HAS_ACCENT_COLOR_SELECTION

/datum/gear/suit/hazard_vest_colorable/New()
	..()
	var/list/hazard_vest = list()
	hazard_vest["colorable hazard vest"] = /obj/item/clothing/suit/storage/hazardvest/colorable
	hazard_vest["colorable hazard vest, alt"] = /obj/item/clothing/suit/storage/hazardvest/colorable/alt
	gear_tweaks += new /datum/gear_tweak/path(hazard_vest)
