/obj/structure/closet/crate/secure/gear_loadout
	desc = "A secure gear crate."
	name = "gear crate"


//ninja stuff
/obj/structure/closet/crate/secure/gear_loadout/ninja
	var/associated_hardsuit = /obj/item/rig/light/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/fill()
	new associated_hardsuit(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/stealth/fill()
	..()
	new /obj/item/gun/projectile/pistol(src)
	new /obj/item/suppressor(src)
	new /obj/item/ammo_magazine/mc9mm(src)
	new /obj/item/ammo_magazine/mc9mm(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/sol
	associated_hardsuit = /obj/item/rig/military/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/sol/fill()
	..()
	new /obj/item/clothing/under/rank/sol/marine(src)
	new /obj/item/clothing/accessory/holster/armpit/brown(src)
	new /obj/item/gun/projectile/pistol/sol(src)
	new /obj/item/ammo_magazine/mc9mm(src)
	new /obj/item/ammo_magazine/mc9mm(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/gunslinger
	associated_hardsuit = /obj/item/rig/gunslinger/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/gunslinger/fill()
	..()
	new /obj/item/clothing/accessory/holster/armpit/brown(src)
	new /obj/item/gun/projectile/revolver/detective(src)
	new /obj/item/ammo_magazine/c38(src)
	new /obj/item/ammo_magazine/c38(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/breacher/fill()
	..()
	new /obj/item/gun/energy/pistol/hegemony(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/tesla/fill()
	..()
	new /obj/item/clothing/accessory/holster/armpit/brown(src)
	new /obj/item/gun/projectile/pistol/adhomai(src)
	new /obj/item/ammo_magazine/mc9mm(src)
	new /obj/item/ammo_magazine/mc9mm(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/strike
	associated_hardsuit = /obj/item/rig/strike/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/strike/fill()
	..()
	new /obj/item/clothing/accessory/holster/armpit/brown(src)
	new /obj/item/gun/projectile/automatic/x9(src)
	new /obj/item/ammo_magazine/c45m/auto(src)
	new /obj/item/ammo_magazine/c45m/auto(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/jinxiang
	associated_hardsuit = /obj/item/rig/jinxiang/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/jinxiang/fill()
	..()
	new /obj/item/melee/energy/sword/pirate(src)
	new /obj/item/shield/energy/dominia(src)
	new /obj/item/clothing/accessory/holster/armpit/brown(src)
	new /obj/item/gun/projectile/tanto(src)
	new /obj/item/ammo_magazine/mc10mm(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/elyra
	associated_hardsuit = /obj/item/rig/elyran/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/elyra/fill()
	..()
	new /obj/item/gun/projectile/plasma(src)
	new /obj/item/ammo_magazine/plasma(src)
	new /obj/item/ammo_magazine/plasma(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/hacker
	associated_hardsuit = /obj/item/rig/light/hacker/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/hacker/fill()
	..()
	new /obj/item/gun/energy/xray(src)
	new /obj/item/clothing/accessory/holster/armpit/brown(src)
	new /obj/item/gun/energy/crossbow/largecrossbow(src)
	new /obj/item/melee/energy/sword/red(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/frontier
	associated_hardsuit = /obj/item/rig/light/offworlder/frontier/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/frontier/fill()
	..()
	new /obj/item/clothing/accessory/holster/armpit/brown(src)
	new /obj/item/gun/projectile/pistol(src)
	new /obj/item/ammo_magazine/mc9mm(src)
	new /obj/item/ammo_magazine/mc9mm(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/crimson
	associated_hardsuit = /obj/item/rig/merc/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/crimson/fill()
	..()
	new /obj/item/clothing/accessory/holster/armpit/brown(src)
	new /obj/item/gun/projectile/revolver(src)
	new /obj/item/ammo_magazine/a357(src)
	new /obj/item/ammo_magazine/a357(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/rhino
	associated_hardsuit = /obj/item/rig/merc/distress/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/rhino/fill()
	..()
	new /obj/item/gun/projectile/automatic/rifle/sts35(src)
	new /obj/item/ammo_magazine/c762(src)
	new /obj/item/clothing/accessory/holster/armpit/brown(src)
	new /obj/item/gun/projectile/pistol(src)
	new /obj/item/ammo_magazine/mc9mm(src)
	new /obj/item/ammo_magazine/mc9mm(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/einstein
	associated_hardsuit = /obj/item/rig/merc/einstein/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/einstein/fill()
	..()
	new /obj/item/clothing/under/rank/einstein(src)
	new /obj/item/clothing/accessory/holster/hip(src)
	new /obj/item/gun/energy/rifle(src)
	new /obj/item/gun/projectile/pistol(src)
	new /obj/item/suppressor(src)
	new /obj/item/ammo_magazine/mc9mm(src)
	new /obj/item/ammo_magazine/mc9mm(src)

/obj/structure/closet/crate/secure/gear_loadout/ninja/bunker
	associated_hardsuit = /obj/item/rig/bunker/ninja

/obj/structure/closet/crate/secure/gear_loadout/ninja/bunker/fill()
	..()
	new /obj/item/clothing/under/lance(src)
	new /obj/item/clothing/accessory/holster/hip(src)
	new /obj/item/gun/energy/rifle/laser(src)
	new /obj/item/gun/projectile/pistol/super_heavy(src)
	new /obj/item/ammo_magazine/super_heavy(src)
	new /obj/item/ammo_magazine/super_heavy(src)
