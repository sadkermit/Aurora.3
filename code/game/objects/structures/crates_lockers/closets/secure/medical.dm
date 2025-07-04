/obj/structure/closet/secure_closet/medical1
	name = "medicine closet"
	desc = "Filled with medical junk."
	icon_state = "med"
	req_access = list(ACCESS_MEDICAL_EQUIP)

/obj/structure/closet/secure_closet/medical1/fill()
	..()
	new /obj/item/storage/box/syringes(src)
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/reagent_containers/glass/beaker(src)
	new /obj/item/reagent_containers/glass/beaker(src)
	new /obj/item/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/reagent_containers/glass/bottle/inaprovaline(src)
	new /obj/item/reagent_containers/glass/bottle/antitoxin(src)
	new /obj/item/reagent_containers/glass/bottle/antitoxin(src)

/obj/structure/closet/secure_closet/medical2
	name = "anesthetics closet"
	desc = "Used to knock people out."
	icon_state = "med"
	req_access = list(ACCESS_SURGERY)

/obj/structure/closet/secure_closet/medical2/fill()
	new /obj/item/tank/anesthetic(src)
	new /obj/item/tank/anesthetic(src)
	new /obj/item/tank/anesthetic(src)
	new /obj/item/tank/oxygen(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/clothing/mask/breath/medical(src)

/obj/structure/closet/secure_closet/medical3
	name = "medical equipment locker"
	req_access = list(ACCESS_MEDICAL_EQUIP)
	icon_state = "med"

/obj/structure/closet/secure_closet/medical3/fill()
	if(prob(50))
		new /obj/item/storage/backpack/medic(src)
	else
		new /obj/item/storage/backpack/satchel/med(src)
	new /obj/item/storage/backpack/duffel/med(src)
	new /obj/item/clothing/head/nursehat (src)

	switch(pick("blue", "gray", "green", "purple"))
		if("blue")
			new /obj/item/clothing/under/rank/medical/surgeon(src)
			new /obj/item/clothing/head/surgery(src)
			new /obj/item/clothing/suit/storage/surgical_gown(src)
		if ("gray")
			new /obj/item/clothing/under/rank/medical/surgeon/pmc(src)
			new /obj/item/clothing/head/surgery/pmc(src)
			new /obj/item/clothing/suit/storage/surgical_gown/pmc(src)
		if ("green")
			new /obj/item/clothing/under/rank/medical/surgeon/idris(src)
			new /obj/item/clothing/head/surgery/idris(src)
			new /obj/item/clothing/suit/storage/surgical_gown/idris(src)
		if ("purple")
			new /obj/item/clothing/under/rank/medical/surgeon/zeng(src)
			new /obj/item/clothing/head/surgery/zeng(src)
			new /obj/item/clothing/suit/storage/surgical_gown/zeng(src)

	switch(pick("blue", "gray", "green", "purple"))
		if("blue")
			new /obj/item/clothing/under/rank/medical/surgeon(src)
			new /obj/item/clothing/head/surgery(src)
			new /obj/item/clothing/suit/storage/surgical_gown(src)
		if ("gray")
			new /obj/item/clothing/under/rank/medical/surgeon/pmc(src)
			new /obj/item/clothing/head/surgery/pmc(src)
			new /obj/item/clothing/suit/storage/surgical_gown/pmc(src)
		if ("green")
			new /obj/item/clothing/under/rank/medical/surgeon/idris(src)
			new /obj/item/clothing/head/surgery/idris(src)
			new /obj/item/clothing/suit/storage/surgical_gown/idris(src)
		if ("purple")
			new /obj/item/clothing/under/rank/medical/surgeon/zeng(src)
			new /obj/item/clothing/head/surgery/zeng(src)
			new /obj/item/clothing/suit/storage/surgical_gown/zeng(src)

	new /obj/item/clothing/suit/storage/hooded/tajaran/surgery(src)
	new /obj/item/storage/box/gloves(src)
	new /obj/item/clothing/accessory/storage/white_vest(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/pmc(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/idris(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/zeng(src)
	new /obj/item/clothing/head/headmirror
	new /obj/item/clothing/shoes/sneakers/medsci(src)
	new /obj/item/device/radio/headset/headset_med(src)
	new /obj/item/device/radio/headset/headset_med/alt(src)
	new /obj/item/clothing/glasses/hud/health/aviator(src)
	new /obj/item/clothing/glasses/eyepatch/hud/medical(src)

/obj/structure/closet/secure_closet/medical_para
	name = "paramedic's locker"
	desc = "An immobile, card-locked storage unit containing all the necessary equipment for a paramedic."
	req_access = list(ACCESS_PARAMEDIC)
	icon_state = "med"

/obj/structure/closet/secure_closet/medical_para/fill()
	..()
	new /obj/item/storage/backpack/satchel/med(src)
	new /obj/item/storage/backpack/duffel/med(src)
	new /obj/item/clothing/head/hardhat/paramedic(src)
	new /obj/item/device/radio/headset/headset_med(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/storage/backpack/medic(src)
	new /obj/item/clothing/accessory/storage/white_vest(src)
	new /obj/item/clothing/suit/storage/medical_chest_rig(src)
	new /obj/item/clothing/under/rank/medical/paramedic(src)
	new /obj/item/clothing/under/rank/medical/paramedic/zeng(src)
	new /obj/item/clothing/under/rank/medical/paramedic/pmc(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/device/flashlight/pen(src)
	new /obj/item/clothing/accessory/stethoscope(src)
	new /obj/item/storage/belt/medical/paramedic(src)
	new /obj/item/device/gps/medical(src)
	new /obj/item/reagent_containers/hypospray(src)
	new /obj/item/taperoll/medical(src)
	new /obj/item/device/radio/med(src)
	new /obj/item/roller(src)
	new /obj/item/crowbar/red(src)
	new /obj/item/clothing/mask/gas/alt(src)
	new /obj/item/clothing/mask/gas/half(src)
	new /obj/item/auto_cpr(src)
	new /obj/item/clothing/suit/storage/toggle/para_jacket(src)
	new /obj/item/clothing/suit/storage/toggle/para_jacket/zeng(src)
	new /obj/item/clothing/suit/storage/toggle/para_jacket/pmc(src)

/obj/structure/closet/secure_closet/CMO
	name = "chief medical officer's locker"
	req_access = list(ACCESS_CMO)
	icon_state = "cmo"

/obj/structure/closet/secure_closet/CMO/fill()
	if(prob(50))
		new /obj/item/storage/backpack/medic(src)
	else
		new /obj/item/storage/backpack/satchel/med(src)
	new /obj/item/storage/backpack/duffel/med(src)
	new /obj/item/clothing/shoes/sneakers/medsci(src)
	new /obj/item/clothing/under/rank/chief_medical_officer(src)
	new /obj/item/storage/box/gloves(src)
	new /obj/item/device/radio/headset/heads/cmo(src)
	new /obj/item/device/radio/headset/heads/cmo/alt(src)
	new /obj/item/device/megaphone/med(src)
	new /obj/item/device/flash(src)
	new /obj/item/clothing/accessory/storage/white_vest(src)
	new /obj/item/reagent_containers/hypospray/cmo(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/cmo(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/cmoalt(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/cmoalt2(src)
	new /obj/item/storage/box/inhalers(src)
	new /obj/item/clothing/glasses/hud/health/aviator(src)
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/storage/belt/medical(src)
	new /obj/item/clothing/accessory/stethoscope(src)
	new /obj/item/storage/box/fancy/keypouch/med(src)
	new /obj/item/device/advanced_healthanalyzer(src)
	new /obj/item/gun/energy/disruptorpistol/miniature(src)
	new /obj/item/clothing/accessory/holster/waist(src)
	new /obj/item/device/eftpos(src)

/obj/structure/closet/secure_closet/CMO2
	name = "chief medical officer's attire"
	req_access = list(ACCESS_CMO)
	icon_state = "cmo"

/obj/structure/closet/secure_closet/CMO2/fill()
	new /obj/item/storage/backpack/medic(src)
	new /obj/item/storage/backpack/satchel/med(src)
	new /obj/item/clothing/under/rank/medical/surgeon/pmc(src)
	new /obj/item/clothing/head/surgery/pmc(src)
	new /obj/item/clothing/accessory/storage/white_vest(src)
	new /obj/item/clothing/under/rank/medical/surgeon/idris(src)
	new /obj/item/clothing/under/rank/medical/surgeon/idris(src)
	new /obj/item/clothing/under/rank/medical/surgeon/zeng(src)
	new /obj/item/clothing/under/rank/medical/surgeon/zeng(src)
	new /obj/item/clothing/under/rank/chief_medical_officer(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/cmo(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/cmoalt(src)
	new /obj/item/clothing/shoes/sneakers/brown	(src)
	new /obj/item/device/radio/headset/heads/cmo(src)

/obj/structure/closet/secure_closet/animal
	name = "animal control closet"
	req_access = list(ACCESS_SURGERY)

/obj/structure/closet/secure_closet/animal/fill()
	..()
	new /obj/item/device/assembly/signaler(src)
	new /obj/item/device/radio/electropack(src)
	new /obj/item/device/radio/electropack(src)
	new /obj/item/device/radio/electropack(src)

/obj/structure/closet/secure_closet/chemical
	name = "chemistry equipment closet"
	desc = "Contains equipment useful to chemists."
	icon_state = "med"
	icon_door = "chemical"
	req_access = list(ACCESS_PHARMACY)

/obj/structure/closet/secure_closet/chemical/fill()
	..()
	new /obj/item/storage/box/pillbottles(src)
	new /obj/item/storage/box/pillbottles(src)
	new /obj/item/storage/box/spraybottles(src)
	new /obj/item/storage/box/spraybottles(src)
	new /obj/item/storage/box/inhalers(src)
	new /obj/item/storage/box/inhalers_auto(src)
	new /obj/item/storage/box/autoinjectors(src)
	new /obj/item/storage/box/syringes(src)
	new /obj/item/storage/box/beakers(src)
	new /obj/item/storage/box/beakers(src)
	new /obj/item/storage/bag/chemistry(src)
	new /obj/item/storage/bag/chemistry(src)

// Psychiatric
/obj/structure/closet/secure_closet/psychiatric
	name = "psychiatric supplies locker"
	desc = "A psychiatric supplies locker."
	icon_state = "med"
	req_access = list(ACCESS_PSYCHIATRIST)

/obj/structure/closet/secure_closet/psychiatric/fill()
	..()
	new /obj/item/clothing/suit/straight_jacket(src)
	new /obj/item/reagent_containers/glass/beaker/teapot(src)
	new /obj/item/toy/plushie/therapy(src)
	new /obj/item/toy/plushie/slime(src)
	new /obj/item/toy/plushie/bee(src)
	new /obj/item/device/flashlight/pen(src)
	new /obj/item/storage/box/stressball(src)

// Empty
/obj/structure/closet/secure_closet/medical/empty
	name = "medicine closet"
	desc = "A medical locker."
	icon_state = "med"
	req_access = list(ACCESS_MEDICAL_EQUIP)
