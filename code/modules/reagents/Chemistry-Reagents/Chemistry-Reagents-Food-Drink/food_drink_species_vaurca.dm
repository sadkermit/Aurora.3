/singleton/reagent/drink/toothpaste
	name = "Toothpaste"
	description = "A paste commonly used in oral hygiene."
	reagent_state = LIQUID
	color = "#9ddaff"
	taste_description = "toothpaste"
	overdose = REAGENTS_OVERDOSE
	var/strength = 50

	glass_icon_state = "toothpaste"
	glass_name = "glass of toothpaste"
	glass_desc = "Dentists recommend drinking zero glasses a day, and instead brushing normally."
	glass_center_of_mass = list("x"=7, "y"=8)

/singleton/reagent/drink/toothpaste/mouthwash
	name = "Mouthwash"
	description = "A fluid commonly used in oral hygiene."
	reagent_state = LIQUID
	color = "#9df8ff"
	taste_description = "mouthwash"
	overdose = REAGENTS_OVERDOSE
	strength = 75

	glass_icon_state = "mouthwash"
	glass_name = "glass of mouthwash"
	glass_desc = "A minty sip and you're buzzing."
	glass_center_of_mass = list("x"=7, "y"=8)
