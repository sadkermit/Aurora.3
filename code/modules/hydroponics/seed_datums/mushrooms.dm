/////////////////
//  Mushrooms  //
/////////////////
/datum/seed/mushroom
	name = "mushrooms"
	seed_name = "chanterelle"
	seed_noun = SEED_NOUN_SPORES
	display_name = "chanterelle mushrooms"
	mutants = list("reishi","amanita","plumphelmet")
	chems = list(/singleton/reagent/nutriment = list(1,25))
	splat_type = /obj/effect/plant
	kitchen_tag = "mushroom"

/obj/item/seeds/chantermycelium
	seed_type = "mushrooms"

/datum/seed/mushroom/setup_traits()
	..()
	set_trait(TRAIT_MATURATION,7)
	set_trait(TRAIT_PRODUCTION,1)
	set_trait(TRAIT_YIELD,5)
	set_trait(TRAIT_POTENCY,1)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom4")
	set_trait(TRAIT_PRODUCT_COLOUR,"#DBDA72")
	set_trait(TRAIT_PLANT_COLOUR,"#D9C94E")
	set_trait(TRAIT_PLANT_ICON,"mushroom")
	set_trait(TRAIT_WATER_CONSUMPTION, 6)
	set_trait(TRAIT_IDEAL_HEAT, IDEAL_HEAT_COLD)

/datum/seed/mushroom/mold
	name = "mold"
	seed_name = "brown mold"
	display_name = "brown mold"
	mutants = null

/datum/seed/mushroom/mold/setup_traits()
	..()
	set_trait(TRAIT_SPREAD,1)
	set_trait(TRAIT_MATURATION,10)
	set_trait(TRAIT_YIELD,-1)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom5")
	set_trait(TRAIT_PRODUCT_COLOUR,"#7A5F20")
	set_trait(TRAIT_PLANT_COLOUR,"#7A5F20")
	set_trait(TRAIT_PLANT_ICON,"mushroom9")

/obj/item/seeds/brownmold
	seed_type = "mold"

/datum/seed/mushroom/hallucinogenic
	name = "reishi"
	seed_name = "reishi"
	display_name = "reishi"
	mutants = list("libertycap","glowshroom")
	chems = list(/singleton/reagent/nutriment = list(1,50), /singleton/reagent/drugs/psilocybin = list(3,5))

/datum/seed/mushroom/hallucinogenic/setup_traits()
	..()
	set_trait(TRAIT_MATURATION,10)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,4)
	set_trait(TRAIT_POTENCY,15)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom11")
	set_trait(TRAIT_PRODUCT_COLOUR,"#FFB70F")
	set_trait(TRAIT_PLANT_COLOUR,"#F58A18")
	set_trait(TRAIT_PLANT_ICON,"mushroom6")

/obj/item/seeds/reishimycelium
	seed_type = "reishi"

/datum/seed/mushroom/hallucinogenic/strong
	name = "libertycap"
	seed_name = "liberty cap"
	display_name = "liberty cap mushrooms"
	mutants = list("ghostmushroom")
	chems = list(/singleton/reagent/nutriment = list(1), /singleton/reagent/soporific = list(3,3), /singleton/reagent/drugs/psilocybin = list(1,25))

/datum/seed/mushroom/hallucinogenic/strong/setup_traits()
	..()
	set_trait(TRAIT_PRODUCTION,1)
	set_trait(TRAIT_POTENCY,15)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom8")
	set_trait(TRAIT_PRODUCT_COLOUR,"#F2E550")
	set_trait(TRAIT_PLANT_COLOUR,"#D1CA82")
	set_trait(TRAIT_PLANT_ICON,"mushroom3")

/obj/item/seeds/libertymycelium
	seed_type = "libertycap"

/datum/seed/mushroom/poison
	name = "amanita"
	seed_name = "fly amanita"
	display_name = "fly amanita mushrooms"
	mutants = list("destroyingangel","plastic","panocelium")
	chems = list(/singleton/reagent/nutriment = list(1), /singleton/reagent/toxin/amatoxin = list(3,3), /singleton/reagent/drugs/psilocybin = list(1,25))

/datum/seed/mushroom/poison/setup_traits()
	..()
	set_trait(TRAIT_MATURATION,10)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,4)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom")
	set_trait(TRAIT_PRODUCT_COLOUR,"#FF4545")
	set_trait(TRAIT_PLANT_COLOUR,"#E0DDBA")
	set_trait(TRAIT_PLANT_ICON,"mushroom4")

/obj/item/seeds/amanitamycelium
	seed_type = "amanita"

/datum/seed/mushroom/poison/death
	name = "destroyingangel"
	seed_name = "destroying angel"
	display_name = "destroying angel mushrooms"
	mutants = null
	chems = list(/singleton/reagent/nutriment = list(1,50), /singleton/reagent/toxin/amatoxin = list(13,3), /singleton/reagent/drugs/psilocybin = list(1,25))

/datum/seed/mushroom/poison/death/setup_traits()
	..()
	set_trait(TRAIT_MATURATION,12)
	set_trait(TRAIT_YIELD,2)
	set_trait(TRAIT_POTENCY,35)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom3")
	set_trait(TRAIT_PRODUCT_COLOUR,"#EDE8EA")
	set_trait(TRAIT_PLANT_COLOUR,"#E6D8DD")
	set_trait(TRAIT_PLANT_ICON,"mushroom5")

/obj/item/seeds/angelmycelium
	seed_type = "destroyingangel"

/datum/seed/mushroom/poison/panocelium
	name = "panocelium"
	seed_name = "panocelium"
	display_name = "panocelium mushrooms"
	mutants = null
	chems = list(/singleton/reagent/nutriment = list(1,50), /singleton/reagent/toxin/panotoxin = list(10,3), /singleton/reagent/drugs/psilocybin = list(1,25))

/datum/seed/mushroom/poison/panocelium/setup_traits()
	..()
	set_trait(TRAIT_MATURATION,12)
	set_trait(TRAIT_YIELD,4)
	set_trait(TRAIT_POTENCY,20)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom6")
	set_trait(TRAIT_PRODUCT_COLOUR,"#88FFFF")
	set_trait(TRAIT_PLANT_COLOUR,"#88FFFF")
	set_trait(TRAIT_PLANT_ICON,"mushroom6")

/obj/item/seeds/panocelium
	seed_type = "panocelium"

/datum/seed/mushroom/towercap
	name = "towercap"
	seed_name = "tower cap"
	display_name = "tower caps"
	chems = list(/singleton/reagent/woodpulp = list(10,1))
	mutants = null

/datum/seed/mushroom/towercap/setup_traits()
	..()
	set_trait(TRAIT_MATURATION,15)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom7")
	set_trait(TRAIT_PRODUCT_COLOUR,"#79A36D")
	set_trait(TRAIT_PLANT_COLOUR,"#857F41")
	set_trait(TRAIT_PLANT_ICON,"mushroom8")

/obj/item/seeds/towermycelium
	seed_type = "towercap"

/datum/seed/mushroom/glowshroom
	name = "glowshroom"
	seed_name = "glowshroom"
	display_name = "glowshrooms"
	mutants = null
	chems = list(/singleton/reagent/radium = list(1,20))

/datum/seed/mushroom/glowshroom/setup_traits()
	..()
	set_trait(TRAIT_SPREAD,1)
	set_trait(TRAIT_MATURATION,15)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,30)
	set_trait(TRAIT_BIOLUM,1)
	set_trait(TRAIT_BIOLUM_COLOUR,"#006622")
	set_trait(TRAIT_PRODUCT_ICON,"mushroom2")
	set_trait(TRAIT_PRODUCT_COLOUR,"#DDFAB6")
	set_trait(TRAIT_PLANT_COLOUR,"#EFFF8A")
	set_trait(TRAIT_PLANT_ICON,"mushroom7")

/obj/item/seeds/glowshroom
	seed_type = "glowshroom"

/datum/seed/mushroom/plastic
	name = "plastic"
	seed_name = "plastellium"
	display_name = "plastellium"
	mutants = null
	chems = list(/singleton/reagent/toxin/plasticide = list(1,10))

/datum/seed/mushroom/plastic/setup_traits()
	..()
	set_trait(TRAIT_MATURATION,5)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,6)
	set_trait(TRAIT_POTENCY,20)
	set_trait(TRAIT_PRODUCT_ICON,"mushroom6")
	set_trait(TRAIT_PRODUCT_COLOUR,"#E6E6E6")
	set_trait(TRAIT_PLANT_COLOUR,"#E6E6E6")
	set_trait(TRAIT_PLANT_ICON,"mushroom10")

/obj/item/seeds/plastiseed
	seed_type = "plastic"

/datum/seed/mushroom/ghost
	name = "ghostmushroom"
	seed_name = "ghost mushroom"
	display_name = "ghost mushroom"
	mutants = null
	chems = list(/singleton/reagent/toxin/spectrocybin = list(5,15))

/datum/seed/mushroom/ghost/setup_traits()
	..()
	set_trait(TRAIT_MATURATION,5)
	set_trait(TRAIT_PRODUCTION,4)
	set_trait(TRAIT_YIELD,2)
	set_trait(TRAIT_POTENCY,8)
	set_trait(TRAIT_BIOLUM,1)
	set_trait(TRAIT_BIOLUM_COLOUR,"#64B8C9")
	set_trait(TRAIT_PRODUCT_ICON,"mushroom8")
	set_trait(TRAIT_PRODUCT_COLOUR,"#64B8C9")
	set_trait(TRAIT_PLANT_COLOUR,"#64B8C9")
	set_trait(TRAIT_PLANT_ICON,"mushroom3")

/obj/item/seeds/ghostmushroomseed
	seed_type = "ghostmushroom"
