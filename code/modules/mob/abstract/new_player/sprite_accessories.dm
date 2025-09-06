/*

	Hello and welcome to sprite_accessories: For sprite accessories, such as hair,
	facial hair, and possibly tattoos and stuff somewhere along the line. This file is
	intended to be friendly for people with little to no actual coding experience.
	The process of adding in new hairstyles has been made pain-free and easy to do.
	Enjoy! - Doohl


	Notice: This all gets automatically compiled in a list in dna2.dm, so you do not
	have to define any UI values for sprite accessories manually for hair and facial
	hair. Just add in new hair types and the game will naturally adapt.

	Notice for novices: Don't use identical variables *twice*, the most recent one written
	in an indented string will overwrite all the other ones preceding it.

*/

/datum/sprite_accessory
	/// The icon file the accessory is located in.
	var/icon
	/// The icon_state of the accessory.
	var/icon_state
	/// A custom preview state if wanted.
	var/preview_state
	/// The name of the accessory.
	var/name
	/// Determines if the accessory will be skipped or included in random hair generation.
	var/gender = NEUTER
	/// Restrict some styles to specific species. This requires the type path of the datum of the species in question, as well as all children if applicable.
	var/list/species_allowed = list(
		/datum/species/human,
		/datum/species/human/offworlder,
		/datum/species/machine/shell,
		/datum/species/machine/shell/rogue,
		/datum/species/zombie
	)
	/// Whether or not the accessory can be affected by colouration.
	var/do_colouration = TRUE
	/// The blend mode to use when blending this icon with its color. May not apply to all sprite_accessory types, and must be a ICON_* blend mode, not BLEND_*!
	var/icon_blend_mode = ICON_ADD
	/// This is to provide safe names to use for hair/sprite to text. See Skrell tentacles for an example.
	var/chatname
	/// The organ the markings go over. Used to check if a marking can go over a certain organ. Must be an organ tag.
	var/required_organ
	/// Required prosthetic types to use this marking, if any. List is "any of". Null means no robotize type required. Empty list means there must be NO robotize type.
	var/list/robotize_type_required


/*
////////////////////////////
/  =--------------------=  /
/  == Hair Definitions ==  /
/  =--------------------=  /
////////////////////////////

Before you add any new hairstyles, make sure to define them in dna.dm in defines.
Follow by example and make good judgement based on length which list to include it in - Drago

0- No hair
1- Medium/semi short hair
2- Average Hair
3- Longish Hair
4- Very long hair
5- Unathi Horns
6- Skrell Tentacles


*/

/datum/sprite_accessory/hair
	icon = 'icons/mob/human_face/hair.dmi'	  // default icon for all hairs
	var/length = 1
	///Should this hairstyle be kept on a skeleton?
	var/keep_as_skeleton = FALSE

/datum/sprite_accessory/hair/bald
	name = "Bald"   // try to capitalize the names please~
	icon_state = "bald" // you do not need to define _s or _l sub-states, game automatically does this for you
	species_allowed = list(/datum/species/human,/datum/species/human/offworlder,/datum/species/machine/shell,/datum/species/machine/shell/rogue,/datum/species/zombie,/datum/species/unathi,/datum/species/zombie/unathi,/datum/species/diona, /datum/species/diona/coeu, /datum/species/machine, /datum/species/machine/industrial, /datum/species/machine/industrial/hephaestus, /datum/species/machine/industrial/xion, /datum/species/machine/zenghu, /datum/species/machine/bishop)
	length = 0
	chatname = "bald head" //aim to keep these lowercase so they fit into the hair tugging message

/datum/sprite_accessory/hair/eighties
	name = "80's"
	icon_state = "hair_80s"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/eighties_ponytail
	name = "80's Ponytail"
	icon_state = "hair_80s_ponytail"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/eighties_ponytail_alt
	name = "80's Ponytail Alt"
	icon_state = "hair_80s_ponytail_alt"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/afro
	name = "Afro"
	icon_state = "hair_afro"
	length = 3
	chatname = "afro"

/datum/sprite_accessory/hair/afro2
	name = "Afro 2"
	icon_state = "hair_afro2"
	length = 3
	chatname = "afro"

/datum/sprite_accessory/hair/afro3
	name = "Afro, Big"
	icon_state = "hair_afrobig"
	length = 3
	chatname = "big afro"

/datum/sprite_accessory/hair/amanita
	name = "Amanita"
	icon_state = "hair_amanita"
	chatname = "short curls"

/datum/sprite_accessory/hair/amanita_long
	name = "Amanita, Long"
	icon_state = "hair_amanita_long"
	length = 3
	chatname = "long curls"

/datum/sprite_accessory/hair/amanita_long_alt
	name = "Amanita, Long Alt"
	icon_state = "hair_amanita_long_alt"
	length = 3
	chatname = "long curls"

/datum/sprite_accessory/hair/amazon
	name = "Amazon"
	icon_state = "hair_amazon"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/averagejoe
	name = "Average Joe"
	icon_state = "hair_averagejoe"
	chatname = "short hair"

/datum/sprite_accessory/hair/baldingfade
	name = "Balding Fade"
	icon_state = "hair_baldingfade"
	length = 0
	chatname = "bald head"

/datum/sprite_accessory/hair/baldinghair
	name = "Balding Hair"
	icon_state = "hair_baldinghair" //hair_e
	length = 0
	chatname = "balding hair"

/datum/sprite_accessory/hair/bangs
	name = "Bangs"
	icon_state = "hair_bangs"
	length = 3
	chatname = "fringe"

/datum/sprite_accessory/hair/bangs_short
	name = "Bangs, Short"
	icon_state = "hair_bangs_short"
	length = 2
	chatname = "fringe"

/datum/sprite_accessory/hair/bangs_veryshort
	name = "Bangs, Very Short"
	icon_state = "hair_bangs_veryshort"
	chatname = "fringe"

/datum/sprite_accessory/hair/bedhead
	name = "Bedhead"
	icon_state = "hair_bedhead"
	chatname = "messy locks"

/datum/sprite_accessory/hair/bedhead2
	name = "Bedhead 2"
	icon_state = "hair_bedhead2"
	chatname = "messy locks"

/datum/sprite_accessory/hair/bedhead3
	name = "Bedhead 3"
	icon_state = "hair_bedhead3"
	chatname = "wavy hair"

/datum/sprite_accessory/hair/bedhead4
	name = "Bedhead 4"
	icon_state = "hair_bedhead4"
	length = 4
	chatname = "messy locks"

/datum/sprite_accessory/hair/beehive
	name = "Beehive"
	icon_state = "hair_beehive"
	length = 2
	chatname = "beehive hairdo"

/datum/sprite_accessory/hair/beehive2
	name = "Beehive 2"
	icon_state = "hair_beehive2"
	length = 2
	chatname = "beehive hairdo"

/datum/sprite_accessory/hair/beehive3
	name = "Beehive 3"
	icon_state = "hair_beehive3"
	length = 2
	chatname = "beehive hairdo"

/datum/sprite_accessory/hair/belenko
	name = "Belenko"
	icon_state = "hair_belenko"
	length = 2
	chatname = "messy hair"

/datum/sprite_accessory/hair/belenko_tied
	name = "Belenko (Tied)"
	icon_state = "hair_belenkotied"
	length = 2
	chatname = "messy ponytail"

/datum/sprite_accessory/hair/bob
	name = "Bob"
	icon_state = "hair_bob"
	species_allowed = list(/datum/species/human,/datum/species/human/offworlder,/datum/species/machine/shell,/datum/species/machine/shell/rogue,/datum/species/zombie)
	chatname = "short hair"

/datum/sprite_accessory/hair/bob_chin
	name = "Bob, Chin Length"
	icon_state = "hair_bob_chin"
	chatname = "short hair"

/datum/sprite_accessory/hair/bob_kusanagi
	name = "Bob, Kusanagi"
	icon_state = "hair_bob_kusanagi"
	chatname = "short hair"

/datum/sprite_accessory/hair/bob_shoulder
	name = "Bob, Shoulder Length"
	icon_state = "hair_bob_shoulder"
	chatname = "short hair"

/datum/sprite_accessory/hair/bobcurl
	name = "Bobcurl"
	icon_state = "hair_bobcurl"
	species_allowed = list(/datum/species/human,/datum/species/human/offworlder,/datum/species/machine/shell,/datum/species/machine/shell/rogue,/datum/species/zombie)
	chatname = "curls"

/datum/sprite_accessory/hair/bobcurl2
	name = "Bobcurl 2"
	icon_state = "hair_bobcurl2"
	chatname = "curls"

/datum/sprite_accessory/hair/bookish
	name = "Bookish"
	icon_state = "hair_bookish"
	chatname = "short hair"

/datum/sprite_accessory/hair/bowl
	name = "Bowl"
	icon_state = "hair_bowlcut"
	chatname = "bowl cut"

/datum/sprite_accessory/hair/bowlcut2
	name = "Bowl 2"
	icon_state = "hair_bowlcut2"
	chatname = "bowl cut"

/datum/sprite_accessory/hair/bowlcut_birdnest
	name = "Bowl, Birdnest"
	icon_state = "hair_bowlcut_birdnest"
	length = 4
	chatname = "bowl cut"

/datum/sprite_accessory/hair/braid_grande
	name = "Braid, Grande"
	icon_state = "hair_braid_grande"
	length = 3
	chatname = "braid"

/datum/sprite_accessory/hair/braid_medium
	name = "Braid, Medium"
	icon_state = "hair_braid_medium"
	length = 2
	chatname = "braid"

/datum/sprite_accessory/hair/braided
	name = "Braided"
	icon_state = "hair_braided"
	length = 3
	chatname = "braids"

/datum/sprite_accessory/hair/braided_alt
	name = "Braided, Alt"
	icon_state = "hair_braided_alt"
	length = 3
	chatname = "braids"

/datum/sprite_accessory/hair/braided_hipster
	name = "Braided, Hipster"
	icon_state = "hair_braided_hipster"
	length = 3
	chatname = "braids"

/datum/sprite_accessory/hair/bun
	name = "Bun"
	icon_state = "hair_bun"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/bun_casual
	name = "Bun, Casual"
	icon_state = "hair_bun_casual"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/bun_donut
	name = "Bun, Donut"
	icon_state = "hair_bun_donut"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/bun_double
	name = "Bun, Double"
	icon_state = "hair_bun_double"
	length = 3
	chatname = "hair buns"

/datum/sprite_accessory/hair/bun_low
	name = "Bun, Low"
	icon_state = "hair_bun_low"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/bun_manbun
	name = "Bun, Manbun"
	icon_state = "hair_bun_manbun"
	length = 2
	chatname = "manbun"

/datum/sprite_accessory/hair/bun_odango
	name = "Bun, Odango"
	icon_state = "hair_bun_odango"
	length = 2
	chatname = "hair buns"

/datum/sprite_accessory/hair/bun_odango2
	name = "Bun, Odango 2"
	icon_state = "hair_bun_odango2"
	length = 2
	chatname = "hair buns"

/datum/sprite_accessory/hair/bun_odango3
	name = "Bun, Odango 3"
	icon_state = "hair_bun_odango3"
	length = 3
	chatname = "hair buns"

/datum/sprite_accessory/hair/bun_overeye
	name = "Bun, Overeye"
	icon_state = "hair_bun_overeye"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/bun_short
	name = "Bun, Short"
	icon_state = "hair_bun_short"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/bun_short2
	name = "Bun, Short 2"
	icon_state = "hair_bun_short2"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/bun_tight
	name = "Bun, Tight"
	icon_state = "hair_bun_tight"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/bun_topknot
	name = "Bun, Topknot"
	icon_state = "hair_bun_topknot"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/buzzcut
	name = "Buzzcut"
	icon_state = "hair_buzzcut"
	species_allowed = list(/datum/species/human,/datum/species/human/offworlder,/datum/species/machine/shell,/datum/species/machine/shell/rogue,/datum/species/zombie)
	chatname = "unbuzzed hair"	//grabbing the grabbable hair

/datum/sprite_accessory/hair/buzzcut2
	name = "Buzzcut 2"
	icon_state = "hair_buzzcut2"
	species_allowed = list(/datum/species/human,/datum/species/human/offworlder,/datum/species/machine/shell,/datum/species/machine/shell/rogue,/datum/species/zombie)
	chatname = "unbuzzed hair"

/datum/sprite_accessory/hair/bobcut_overeye
	name = "Bobcut, overeye"
	icon_state = "hair_bobcut_overeye"
	length = 2
	chatname = "bobcut"

/datum/sprite_accessory/hair/chop
	name = "Chop"
	icon_state = "hair_chop"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/chrono
	name = "Chrono"
	icon_state = "hair_chrono"
	length = 4
	chatname = "spiked hair"

/datum/sprite_accessory/hair/cia
	name = "CIA"
	icon_state = "hair_cia"
	chatname = "short hair"

/datum/sprite_accessory/hair/coffeehouse
	name = "Coffee House Cut"
	icon_state = "hair_coffeehouse"
	chatname = "coffee house haircut"

/datum/sprite_accessory/hair/coffeehouse_shave
	name = "Coffee House Shave"
	icon_state = "hair_coffeehouse_shave"
	chatname = "coffee house haircut"

/datum/sprite_accessory/hair/combover
	name = "Combover"
	icon_state = "hair_combover"
	chatname = "groomed hair"

/datum/sprite_accessory/hair/country
	name = "Country"
	icon_state = "hair_country"
	chatname = "ponytail"

/datum/sprite_accessory/hair/crew
	name = "Crewcut"
	icon_state = "hair_crewcut"
	chatname = "short hair"

/datum/sprite_accessory/hair/curls
	name = "Curls"
	icon_state = "hair_curls"
	chatname = "curls"

/datum/sprite_accessory/hair/cut
	name = "Cut Hair"
	icon_state = "hair_cuthair" //hair_c
	chatname = "short hair"

/datum/sprite_accessory/hair/devillock
	name = "Devil Lock"
	icon_state = "hair_devilock"
	chatname = "devil locks"

/datum/sprite_accessory/hair/dreadlocks
	name = "Dreadlocks"
	icon_state = "hair_dreads"
	length = 4
	chatname = "dreadlocks"

/datum/sprite_accessory/hair/drills_drillruru
	name = "Drills, Drillruru"
	icon_state = "hair_drills_drillruru"
	length = 2
	chatname = "hair drills"

/datum/sprite_accessory/hair/drills_drillruru_long
	name = "Drills, Drillruru Long"
	icon_state = "hair_drills_drillruru_long"
	length = 3
	chatname = "hair drills"

/datum/sprite_accessory/hair/diagonal_bangs
	name = "Diagonal Bangs"
	icon_state = "hair_diagonal_bangs"
	length = 2
	chatname = "bangs"

/datum/sprite_accessory/hair/eagle
	name = "Eagle"
	icon_state = "hair_eagle"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/emo
	name = "Emo"
	icon_state = "hair_emo"
	chatname = "fringe"

/datum/sprite_accessory/hair/emo_alt
	name = "Emo, Alt"
	icon_state = "hair_emo_alt"
	chatname = "fringe"

/datum/sprite_accessory/hair/emo_long
	name = "Emo, Long"
	icon_state = "hair_emo_long"
	chatname = "long fringe"
	length = 2

/datum/sprite_accessory/hair/emofringe
	name = "Emo Fringe"
	icon_state = "hair_emofringe"
	chatname = "fringe"

/datum/sprite_accessory/hair/emofringe_long
	name = "Emo Fringe Long"
	icon_state = "hair_emofringe_long"
	length = 3
	chatname = "long fringe"

/datum/sprite_accessory/hair/emofringe_longbun
	name = "Emo Fringe Long Bun"
	icon_state = "hair_emofringe_longbun"
	length = 3
	chatname = "hair bun"

/datum/sprite_accessory/hair/emorightfringe_long
	name = "Emo Right Fringe Long"
	icon_state = "hair_emofringe_long"
	length = 3
	chatname = "long fringe"

/datum/sprite_accessory/hair/emofringe_long_alt
	name = "Emo Fringe Long Alt"
	icon_state = "hair_emofringe_longalt"
	length = 3
	chatname = "long fringe"

/datum/sprite_accessory/hair/emorightfringe_long_alt
	name = "Emo Right Fringe Long Alt"
	icon_state = "hair_emorightfringe_longalt"
	length = 3
	chatname = "long fringe"

/datum/sprite_accessory/hair/fade_clean
	name = "Fade, Clean"
	icon_state = "hair_fade_clean"
	chatname = "short hair"

/datum/sprite_accessory/hair/fade_cleanlow
	name = "Fade, Clean Low"
	icon_state = "hair_fade_cleanlow"
	chatname = "short hair"

/datum/sprite_accessory/hair/fade_high
	name = "Fade, High"
	icon_state = "hair_fade_high"
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/fade_low
	name = "Fade, Low"
	icon_state = "hair_fade_low"
	chatname = "short hair"

/datum/sprite_accessory/hair/fade_manbun
	name = "Fade, Manbun"
	icon_state = "hair_fade_manbun"
	chatname = "short hair"

/datum/sprite_accessory/hair/fade_medium
	name = "Fade, Medium"
	icon_state = "hair_fade_medium"
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/fade_none
	name = "Fade, None"
	icon_state = "hair_fade_none"
	chatname = "short hair"

/datum/sprite_accessory/hair/falcon
	name = "Falcon"
	icon_state = "hair_falcon"
	length = 3
	chatname = "very long hair"

/datum/sprite_accessory/hair/father
	name = "Father"
	icon_state = "hair_father"
	chatname = "short hair"

/datum/sprite_accessory/hair/feather
	name = "Feather"
	icon_state = "hair_feather"
	length = 2
	chatname = "short hair"

/datum/sprite_accessory/hair/flat_top
	name = "Flat Top"
	icon_state = "hair_flattop"
	chatname = "flat top hair"

/datum/sprite_accessory/hair/flair
	name = "Flaired Hair"
	icon_state = "hair_flair"
	length = 2
	chatname = "flaired hair"

/datum/sprite_accessory/hair/flow
	name = "Flow Hair"
	icon_state = "hair_flow" //hair_f
	chatname = "short hair"

/datum/sprite_accessory/hair/gelled
	name = "Gelled Back"
	icon_state = "hair_gelled"
	length = 2
	chatname = "gelled-back hair"

/datum/sprite_accessory/hair/gentle
	name = "Gentle"
	icon_state = "hair_gentle"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/gentlealt
	name = "Gentle Alt"
	icon_state = "hair_gentlealt"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/gentle2
	name = "Gentle 2"
	icon_state = "hair_gentle2"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/gentle2_alt
	name = "Gentle 2, Alt"
	icon_state = "hair_gentle2_alt"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/gentle2_long
	name = "Gentle 2, Long"
	icon_state = "hair_gentle2_long"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/gentle2_longalt
	name = "Gentle 2, Long Alt"
	icon_state = "hair_gentle2_longalt"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/gentle3
	name = "Gentle 3"
	icon_state = "hair_gentle3"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/gentle3_alt
	name = "Gentle 3, Alt"
	icon_state = "hair_gentle3_alt"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/glossy
	name = "Glossy"
	icon_state = "hair_glossy"
	length = 2
	chatname = "short hair"

/datum/sprite_accessory/hair/halfbang
	name = "Half-banged Hair"
	icon_state = "hair_halfbang"
	chatname = "short hair"

/datum/sprite_accessory/hair/halfbangalt
	name = "Half-banged Hair, Alt"
	icon_state = "hair_halfbang_alt"
	chatname = "short hair"

/datum/sprite_accessory/hair/himecut
	name = "Hime Cut"
	icon_state = "hair_himecut"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/himecut_alt
	name = "Hime Cut, Alt"
	icon_state = "hair_himecut_alt"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/himecut_alt2
	name = "Hime Cut, Alt 2"
	icon_state = "hair_himecut_alt2"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/himecut_long
	name = "Hime Cut, Long"
	icon_state = "hair_himecut_long"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/himecut_long_ponytail
	name = "Hime Cut, Long Ponytail"
	icon_state = "hair_himecut_long_ponytail"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/himecut_ponytail
	name = "Hime Cut, Ponytail"
	icon_state = "hair_himecut_ponytail"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/himecut_ponytail_up
	name = "Hime Cut, Ponytail Up"
	icon_state = "hair_himecut_ponytail_up"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/himecut_short
	name = "Hime Cut, Short"
	icon_state = "hair_himecut_short"
	chatname = "short hair"

/datum/sprite_accessory/hair/hitop
	name = "Hitop"
	icon_state = "hair_hitop"
	chatname = "hitop"

/datum/sprite_accessory/hair/hummingbird
	name = "Hummingbird"
	icon_state = "hair_hummingbird"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/jade
	name = "Jade"
	icon_state = "hair_jade"
	length = 2
	chatname = "messy hair"

/datum/sprite_accessory/hair/jaeger
	name = "Jaeger"
	icon_state = "hair_jaeger"
	chatname = "short hair"

/datum/sprite_accessory/hair/jensen
	name = "Jensen Hair"  // Removing Videogame References
	icon_state = "hair_jensen"
	chatname = "short hair"

/datum/sprite_accessory/hair/joestar
	name = "Joestar"
	icon_state = "hair_joestar"
	chatname = "short hair"

/datum/sprite_accessory/hair/longfringe
	name = "Long Fringe"
	icon_state = "hair_longfringe"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/longfringe_longer
	name = "Long Fringe, Longer"
	icon_state = "hair_longfringe_longer"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/long
	name = "Long Hair"
	icon_state = "hair_long"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/long_alt
	name = "Long Hair, Alt"
	icon_state = "hair_long_alt"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/long_shoulder
	name = "Long Hair, Shoulder-length"
	icon_state = "hair_long_shoulder" //hair_b
	length = 2
	chatname = "shoulder-length hair"

/datum/sprite_accessory/hair/long_verylong
	name = "Long Hair, Very Long"
	icon_state = "hair_long_verylong"
	length = 4
	chatname = "very long hair"

/datum/sprite_accessory/hair/long_wavy
	name = "Long Hair, Wavy"
	icon_state = "hair_long_wavy"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/macaw
	name = "Macaw"
	icon_state = "hair_macaw"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/magpie
	name = "Magpie, 1"
	icon_state = "hair_magpie"

/datum/sprite_accessory/hair/magpie/two
	name = "Magpie, 2"
	icon_state = "hair_magpie2"

/datum/sprite_accessory/hair/magpie/three
	name = "Magpie, 3"
	icon_state = "hair_magpie3"

/datum/sprite_accessory/hair/magpie/four
	name = "Magpie, 4"
	icon_state = "hair_magpie4"

/datum/sprite_accessory/hair/marysue
	name = "Mary Sue"
	icon_state = "hair_marysue"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/messy
	name = "Messy"
	icon_state = "hair_messy"
	length = 2
	chatname = "messy hair"

/datum/sprite_accessory/hair/messy_alt
	name = "Messy, Alt"
	icon_state = "hair_messy_alt"
	length = 2
	chatname = "messy hair"

/datum/sprite_accessory/hair/messy_alt_rounded
	name = "Messy, Alt (Rounded)"
	icon_state = "hair_messy_alt_rounded"
	length = 2
	chatname = "messy hair"

/datum/sprite_accessory/hair/modern
	name = "Modern"
	icon_state = "hair_modern"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/mohawk
	name = "Mohawk"
	icon_state = "hair_mohawk"
	chatname = "mohawk"

/datum/sprite_accessory/hair/mohawk_big
	name = "Mohawk, Big"
	icon_state = "hair_mohawk_big"
	chatname = "mohawk"

/datum/sprite_accessory/hair/mohawk_high
	name = "Mohawk, High"
	icon_state = "hair_mohawk_high" //hair_d
	chatname = "mohawk"

/datum/sprite_accessory/hair/mohawk_hightight
	name = "Mohawk, High and Tight"
	icon_state = "hair_mohawk_hightight"
	chatname = "mohawk"

/datum/sprite_accessory/hair/mohawk_naomi
	name = "Mohawk, Naomi"
	icon_state = "hair_mohawk_naomi" //slightly longer on the side icons, in case you were wondering
	chatname = "mohawk"

/datum/sprite_accessory/hair/mohawk_reverse
	name = "Mohawk, Reverse"
	icon_state = "hair_mohawk_reverse"
	chatname = "short hair"

/datum/sprite_accessory/hair/mohawk_shaved
	name = "Mohawk, Shaved"
	icon_state = "hair_mohawk_shaved"
	chatname = "mohawk"

/datum/sprite_accessory/hair/mohawk_shavedlong
	name = "Mohawk, Shaved and Long"
	icon_state = "hair_mohawk_shavedlong"
	chatname = "mohawk"

/datum/sprite_accessory/hair/mohawk_shavedback
	name = "Mohawk, Shaved Back"
	icon_state = "hair_mohawk_shavedback"
	chatname = "mohawk"

/datum/sprite_accessory/hair/mohawk_shavedbacklong
	name = "Mohawk, Shaved Back and Long"
	icon_state = "hair_mohawk_shavedbacklong"
	chatname = "mohawk"

/datum/sprite_accessory/hair/mohawk_shavedtight
	name = "Mohawk, Shaved and Tight"
	icon_state = "hair_mohawk_shavedtight"
	chatname = "mohawk"

/datum/sprite_accessory/hair/mulder
	name = "Mulder"
	icon_state = "hair_mulder"
	chatname = "short hair"

/datum/sprite_accessory/hair/neat
	name = "Neat"
	icon_state = "hair_neat"
	chatname = "groomed hair"

/datum/sprite_accessory/hair/neatlong
	name = "Neat (Long)"
	icon_state = "hair_neatlong"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/newyou
	name = "New You"
	icon_state = "hair_newyou"
	length = 3
	chatname = "ponytail"

/datum/sprite_accessory/hair/nia
	name = "Nia"
	icon_state = "hair_nia"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/ombre
	name = "Ombre"
	icon_state = "hair_ombre"
	length = 2
	chatname = "short hair"

/datum/sprite_accessory/hair/oneshoulder
	name = "One Shoulder"
	icon_state = "hair_oneshoulder"
	length = 2
	chatname = "one shoulder hairstyle"

/datum/sprite_accessory/hair/overeye_long
	name = "Overeye, Long"
	icon_state = "hair_overeye_long"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/overeye_short
	name = "Overeye, Short"
	icon_state = "hair_overeye_short"
	chatname = "long hair"
	length = 2

/datum/sprite_accessory/hair/overeye_verylong
	name = "Overeye, Very Long"
	icon_state = "hair_overeye_verylong"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/overeye_veryshort
	name = "Overeye, Very Short"
	icon_state = "hair_overeye_veryshort"
	chatname = "short hair"

/datum/sprite_accessory/hair/overeye_veryshort_alt
	name = "Overeye, Very Short Alt"
	icon_state = "hair_overeye_veryshort_alt"
	chatname = "short hair"

/datum/sprite_accessory/hair/oxton
	name = "Oxton"
	icon_state = "hair_oxton"
	chatname = "short hair"

/datum/sprite_accessory/hair/parted
	name = "Parted"
	icon_state = "hair_parted"
	chatname = "short hair"

/datum/sprite_accessory/hair/parted_alt
	name = "Parted, Alt"
	icon_state = "hair_parted_alt"
	chatname = "short hair"

/datum/sprite_accessory/hair/parted_swept
	name = "Parted, Swept"
	icon_state = "hair_parted_swept"
	chatname = "short hair"

/datum/sprite_accessory/hair/pigtails_belle
	name = "Pigtails, Belle"
	icon_state = "hair_pigtails_belle"
	gender = FEMALE
	length = 2
	chatname = "pigtails"

/datum/sprite_accessory/hair/pigtails_kagami
	name = "Pigtails, Kagami"
	icon_state = "hair_pigtails_kagami"
	length = 2
	chatname = "pigtails"

/datum/sprite_accessory/hair/pigtails_low
	name = "Pigtails, Low"
	icon_state = "hair_pigtails_low"
	length = 2
	chatname = "pigtails"

/datum/sprite_accessory/hair/pigtails_nitori
	name = "Pigtails, Nitori"
	icon_state = "hair_pigtails_nitori"
	length = 2
	chatname = "pigtails"

/datum/sprite_accessory/hair/pigtails_twintail
	name = "Pigtails, Twintail"
	icon_state = "hair_pigtails_twintail"
	length = 2
	chatname = "pigtails"

/datum/sprite_accessory/hair/pigtails_twintail_ombre
	name = "Pigtails, Twintail Ombre"
	icon_state = "hair_pigtails_twintail_ombre"
	length = 2
	chatname = "pigtails"

/datum/sprite_accessory/hair/pigtails_twintail_ombre_alt
	name = "Pigtails, Twintail Ombre Alt"
	icon_state = "hair_pigtails_twintail_ombre_alt"
	length = 3
	chatname = "pigtails"

/datum/sprite_accessory/hair/pompadour
	name = "Pompadour"
	icon_state = "hair_pompadour"
	length = 3
	chatname = "pompadour"

/datum/sprite_accessory/hair/pompadour_dandy
	name = "Pompadour, Dandy"
	icon_state = "hair_pompadour_dandy"
	length = 3
	chatname = "pompadour"

/datum/sprite_accessory/hair/ponytail1
	name = "Ponytail 1"
	icon_state = "hair_ponytail1"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail2
	name = "Ponytail 2"
	icon_state = "hair_ponytail2" //hair_pa
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail3
	name = "Ponytail 3"
	icon_state = "hair_ponytail3"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail4
	name = "Ponytail 4"
	icon_state = "hair_ponytail4"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail5
	name = "Ponytail 5"
	icon_state = "hair_ponytail5"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail6
	name = "Ponytail 6"
	icon_state = "hair_ponytail6"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail7
	name = "Ponytail 7"
	icon_state = "hair_ponytail7"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail7_notie
	name = "Ponytail 7, No Tie"
	icon_state = "hair_ponytail7_notie"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail8
	name = "Ponytail 8"
	icon_state = "hair_ponytail8"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail9
	name = "Ponytail 9"
	icon_state = "hair_ponytail9"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_short
	name = "Ponytail, Short"
	icon_state = "hair_ponytail_short"
	length = 2
	chatname = "short ponytail"

/datum/sprite_accessory/hair/ponytail_short2
	name = "Ponytail, Short 2"
	icon_state = "hair_ponytail_short2"
	length = 2
	chatname = "short ponytail"

/datum/sprite_accessory/hair/ponytail_short3
	name = "Ponytail, Short 3"
	icon_state = "hair_ponytail_short3"
	length = 2
	chatname = "short ponytail"

/datum/sprite_accessory/hair/ponytail_short3_notie
	name = "Ponytail, Short 3, No Tie"
	icon_state = "hair_ponytail_short3_notie"
	length = 2
	chatname = "short ponytail"

/datum/sprite_accessory/hair/ponytail_short4
	name = "Ponytail, Short 4"
	icon_state = "hair_ponytail_short4"
	length = 2
	chatname = "short ponytail"

/datum/sprite_accessory/hair/ponytail_short5
	name = "Ponytail, Short 5"
	icon_state = "hair_ponytail_short5"
	length = 2
	chatname = "short ponytail"

/datum/sprite_accessory/hair/ponytail_short5_alt
	name = "Ponytail, Short 5, Alt"
	icon_state = "hair_ponytail_short5_alt"
	length = 2
	chatname = "short ponytail"

/datum/sprite_accessory/hair/ponytail_fringetail
	name = "Ponytail, Fringetail"
	icon_state = "hair_ponytail_fringetail"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_fringetail_notie
	name = "Ponytail, Fringetail, No Tie"
	icon_state = "hair_ponytail_fringetail_notie"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_high
	name = "Ponytail, High"
	icon_state = "hair_ponytail_high"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_high_notie
	name = "Ponytail, High, No Tie"
	icon_state = "hair_ponytail_high_notie"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_side
	name = "Ponytail, Side"
	icon_state = "hair_ponytail_side"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_side_notie
	name = "Ponytail, Side, No Tie"
	icon_state = "hair_ponytail_side_notie"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_side2
	name = "Ponytail, Side 2"
	icon_state = "hair_ponytail_side2"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_side2_notie
	name = "Ponytail, Side 2, No Tie"
	icon_state = "hair_ponytail_side2_notie"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_side3
	name = "Ponytail, Side 3"
	icon_state = "hair_ponytail_side3"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_side3_notie
	name = "Ponytail, Side 3, No Tie"
	icon_state = "hair_ponytail_side3_notie"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_side4
	name = "Ponytail, Side 4"
	icon_state = "hair_ponytail_side4"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_side4_notie
	name = "Ponytail, Side 4, No Tie"
	icon_state = "hair_ponytail_side4_notie"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_spiky
	name = "Ponytail, Spiky"
	icon_state = "hair_ponytail_spiky"
	length = 4
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_wisp
	name = "Ponytail, Wisp"
	icon_state = "hair_ponytail_wisp"
	length = 3
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_zieglertail
	name = "Ponytail, Zieglertail"
	icon_state = "hair_ponytail_ziegler"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/ponytail_zieglertail_notie
	name = "Ponytail, Zieglertail, No Tie"
	icon_state = "hair_ponytail_ziegler_notie"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/bunlarge2
	name = "Bun, Large 2"
	icon_state = "hair_bun_large2"
	length = 2
	chatname = "large bun"

/datum/sprite_accessory/hair/bunlarge2_notie
	name = "Bun, Large 2, No Tie"
	icon_state = "hair_bun_large2_notie"
	length = 2
	chatname = "large bun"

/datum/sprite_accessory/hair/poofy
	name = "Poofy"
	icon_state = "hair_poofy"
	length = 2
	chatname = "poofy hair"

/datum/sprite_accessory/hair/poofy2
	name = "Poofy 2"
	icon_state = "hair_poofy2"
	length = 2
	chatname = "poofy hair"

/datum/sprite_accessory/hair/poofy3
	name = "Poofy 3"
	icon_state = "hair_poofy3"
	length = 2
	chatname = "poofy hair"

/datum/sprite_accessory/hair/poofy4
	name = "Poofy 4"
	icon_state = "hair_poofy4"
	length = 2
	chatname = "poofy hair"

/datum/sprite_accessory/hair/punk_chelsea
	name = "Punk Shave, Chelsea"
	icon_state = "hair_punk_chelsea"
	chatname = "fringe"

/datum/sprite_accessory/hair/punk_chelsea_bighawk
	name = "Punk Shave, Chelsea Big Hawk"
	icon_state = "hair_punk_chelsea_bighawk"
	chatname = "mohawk"

/datum/sprite_accessory/hair/punk_chelsea_smallhawk
	name = "Punk Shave, Chelsea Small Hawk"
	icon_state = "hair_punk_chelsea_smallhawk"
	chatname = "mohawk"

/datum/sprite_accessory/hair/punk_chelsea_ponytail
	name = "Punk Shave, Chelsea Ponytail"
	icon_state = "hair_punk_chelsea_ponytail"
	chatname = "ponytail"

/datum/sprite_accessory/hair/punk_chelseafringe
	name = "Punk Shave, Chelsea Fringe"
	icon_state = "hair_punk_chelseafringe"
	chatname = "fringe"

/datum/sprite_accessory/hair/punk_chelseafringealt
	name = "Punk Shave, Chelsea Fringe Alt"
	icon_state = "hair_punk_chelseafringe_alt"
	chatname = "fringe"

/datum/sprite_accessory/hair/punk_chelseafringe_bighawk
	name = "Punk Shave, Chelsea Big Hawk"
	icon_state = "hair_punk_chelseafringe_bighawk"
	chatname = "mohawk"

/datum/sprite_accessory/hair/punk_chelseafringe_smallhawk
	name = "Punk Shave, Chelsea Small Hawk"
	icon_state = "hair_punk_chelseafringe_smallhawk"
	chatname = "mohawk"

/datum/sprite_accessory/hair/punk_chelseafringe_ponytail
	name = "Punk Shave, Chelsea Ponytail"
	icon_state = "hair_punk_chelseafringe_ponytail"
	chatname = "ponytail"

/datum/sprite_accessory/hair/punk_halfshaved
	name = "Punk Shave, Half-Shaved"
	icon_state = "hair_punk_halfshaved"
	chatname = "unshaved hair"		// grabbing the parts that can be grabbed

/datum/sprite_accessory/hair/punk_halfshaved_alt
	name = "Punk Shave, Half-Shaved Alt"
	icon_state = "hair_punk_halfshaved_alt"
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/punk_halfshaved_bun
	name = "Punk Shave, Half-Shaved Bun"
	icon_state = "hair_punk_halfshaved_bun"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/punk_halfshaved_bun_alt
	name = "Punk Shave, Half-Shaved Bun Alt"
	icon_state = "hair_punk_halfshaved_bun_alt"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/punk_halfshaved_emo
	name = "Punk Shave, Half-Shaved Emo"
	icon_state = "hair_punk_halfshaved_emo"
	length = 2
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/punk_sidecut_left
	name = "Punk Shave, Sidecut Left"
	icon_state = "hair_punk_sideleft"
	length = 2
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/punk_sidecut_left_sh
	name = "Punk Shave, Sidecut Short Left"
	icon_state = "hair_punk_sideleft_sh"
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/punk_sidecut_right
	name = "Punk Shave, Sidecut Right"
	icon_state = "hair_punk_sideright"
	length = 2
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/punk_sidecut_right_sh
	name = "Punk Shave, Sidecut Short Right"
	icon_state = "hair_punk_sideright_sh"
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/quiff
	name = "Quiff"
	icon_state = "hair_quiff"
	length = 2
	chatname = "quiff"

/datum/sprite_accessory/hair/ronin
	name = "Ronin"
	icon_state = "hair_ronin"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/rosa
	name = "Rosa"
	icon_state = "hair_rosa"
	chatname = "short hair"

/datum/sprite_accessory/hair/rows
	name = "Rows"
	icon_state = "hair_rows"
	length = 2
	chatname = "cornrows"

/datum/sprite_accessory/hair/rows_braid
	name = "Rows, Braid"
	icon_state = "hair_rows_braid"
	length = 2
	chatname = "cornrows"

/datum/sprite_accessory/hair/rows_bun
	name = "Rows, Bun"
	icon_state = "hair_rows_bun"
	length = 2
	chatname = "cornrows"

/datum/sprite_accessory/hair/rows_dualtail
	name = "Rows, Dual Tail"
	icon_state = "hair_rows_dualtail"
	length = 2
	chatname = "cornrows"

/datum/sprite_accessory/hair/rows_long
	name = "Rows, Long"
	icon_state = "hair_rows_long"
	length = 2
	chatname = "cornrows"

/datum/sprite_accessory/hair/scully
	name = "Scully"
	icon_state = "hair_scully"
	chatname = "short hair"

/datum/sprite_accessory/hair/shaved
	name = "Shaved"
	icon_state = "hair_shaved"
	length = 0
	chatname = "shaved head"

/datum/sprite_accessory/hair/short
	name = "Short Hair"
	icon_state = "hair_shorthair" //hair_a
	chatname = "short hair"

/datum/sprite_accessory/hair/short2
	name = "Short Hair 2"
	icon_state = "hair_shorthair2"
	chatname = "short hair"

/datum/sprite_accessory/hair/short3
	name = "Short Hair 3"
	icon_state = "hair_shorthair3"
	chatname = "short hair"

/datum/sprite_accessory/hair/short4
	name = "Short Hair 4"
	icon_state = "hair_shorthair4"
	chatname = "short hair"

/datum/sprite_accessory/hair/sideswept
	name = "Sideswept Hair"
	icon_state = "hair_sideswept"
	chatname = "short hair"

/datum/sprite_accessory/hair/skinhead
	name = "Skinhead"
	icon_state = "hair_skinhead"
	chatname = "matted shaved hair"

/datum/sprite_accessory/hair/sleeze
	name = "Sleeze"
	icon_state = "hair_sleeze"
	chatname = "short hair"

/datum/sprite_accessory/hair/slick
	name = "Slick"
	icon_state = "hair_slick"
	chatname = "slicked hair"

/datum/sprite_accessory/hair/spiky
	name = "Spiky"
	icon_state = "hair_spiky"
	chatname = "mighty spikes"

/datum/sprite_accessory/hair/straightlong
	name = "Straight Long"
	icon_state = "hair_straightlong"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/surfer
	name = "Surfer"
	icon_state = "hair_surfer"
	length = 2
	chatname = "short hair"

/datum/sprite_accessory/hair/thinning
	name = "Thinning"
	icon_state = "hair_thinning"
	chatname = "short hair"

/datum/sprite_accessory/hair/thinningback
	name = "Thinning Back"
	icon_state = "hair_thinningback"
	chatname = "short hair"

/datum/sprite_accessory/hair/thinningfront
	name = "Thinning Front"
	icon_state = "hair_thinningfront"
	chatname = "short hair"

/datum/sprite_accessory/hair/tresshoulder
	name = "Tress Shoulder"
	icon_state = "hair_tressshoulder"
	length = 2
	chatname = "curls"

/datum/sprite_accessory/hair/tresshoulderdouble
	name = "Tress Shoulder Double"
	icon_state = "hair_tressshoulder_double"
	length = 2
	chatname = "curls"

/datum/sprite_accessory/hair/trimmed
	name = "Trimmed"
	icon_state = "hair_trimmed"
	chatname = "trimmed hair"

/datum/sprite_accessory/hair/trimmedflat
	name = "Trimmed Flat Top"
	icon_state = "hair_trimmedflat"
	chatname = "trimmed hair"

/datum/sprite_accessory/hair/twincurls
	name = "Twincurls"
	icon_state = "hair_twincurls"
	length = 2
	chatname = "curls"

/datum/sprite_accessory/hair/twincurls2
	name = "Twincurls 2"
	icon_state = "hair_twincurls2"
	length = 2
	chatname = "curls"

/datum/sprite_accessory/hair/undercut
	name = "Undercut"
	icon_state = "hair_undercut"
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/undercut2
	name = "Undercut 2"
	icon_state = "hair_undercut2"
	chatname = "undercut"

/datum/sprite_accessory/hair/undercut3
	chatname = "unshaved hair"
	name = "Undercut 3"
	icon_state = "hair_undercut3"

/datum/sprite_accessory/hair/undercut4
	name = "Undercut 4"
	icon_state = "hair_undercut4"
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/undercut5
	name = "Undercut 5"
	icon_state = "hair_undercut5"
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/curtain
	name = "Short Curtain"
	icon_state = "hair_curtain"
	chatname = "unshaved hair"

/datum/sprite_accessory/hair/unkept
	name = "Unkept"
	icon_state = "hair_unkept"
	length = 3
	chatname = "unkept hairdo"

/datum/sprite_accessory/hair/updo
	name = "Updo"
	icon_state = "hair_updo"
	length = 2
	chatname = "updo"

/datum/sprite_accessory/hair/vegeta
	name = "Vegeta"
	icon_state = "hair_vegeta"
	length = 4
	chatname = "mighty spikes"

/datum/sprite_accessory/hair/volaju
	name = "Volaju"
	icon_state = "hair_volaju"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/wheeler
	name = "Wheeler"
	icon_state = "hair_wheeler"
	chatname = "short hair"

/datum/sprite_accessory/hair/wolfcut
	name = "Wolfcut"
	icon_state = "hair_wolfcut"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/wolfcut_alt
	name = "Wolfcut, Alt"
	icon_state = "hair_wolfcut_alt"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/fingerwave
	name = "Fingerwave"
	icon_state = "hair_fingercurl"
	chatname = "fluffy hair"

/datum/sprite_accessory/hair/mullet
	name = "Mullet"
	icon_state = "hair_mullet"
	chatname = "mullet"

// TG-format hair - uses ICON_MULTIPLY instead of ICON_ADD
/datum/sprite_accessory/hair/balding
	icon = 'icons/mob/human_face/hair_multiply.dmi'
	icon_blend_mode = ICON_MULTIPLY
	name = "Balding"
	icon_state = "hair_balding"
	length = 0
	chatname = "balding hair"

/datum/sprite_accessory/hair/balding/balding_boddicker
	name = "Balding, Boddicker"
	icon_state = "hair_balding_boddicker"
	length = 1
	chatname = "balding hair"

/datum/sprite_accessory/hair/balding/bangs_light
	name = "Bangs, Light"
	icon_state = "hair_bangs_light"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/balding/bob_alt
	name = "Bob, Alt"
	icon_state = "hair_bob_alt"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/braided_tail
	name = "Braided, Tail"
	icon_state = "hair_braided_tail"
	length = 2
	chatname = "braids"

/datum/sprite_accessory/hair/balding/bun_large
	name = "Bun, Large"
	icon_state = "hair_bun_large"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/balding/bun_librarian
	name = "Bun, Librarian"
	icon_state = "hair_bun_librarian"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/balding/bun_quad
	name = "Bun, Quad"
	icon_state = "hair_bun_quad"
	length = 2
	chatname = "hair buns"

/datum/sprite_accessory/hair/balding/bun_uniter
	name = "Bun, Uniter"
	icon_state = "hair_bun_uniter"
	length = 2
	chatname = "hair bun"

/datum/sprite_accessory/hair/balding/business
	name = "Business"
	icon_state = "hair_business"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/business2
	name = "Business 2"
	icon_state = "hair_business2"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/business3
	name = "Business 3"
	icon_state = "hair_business3"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/business4
	name = "Business 4"
	icon_state = "hair_business4"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/cactus
	name = "Cactus"
	icon_state = "hair_cactus"
	length = 3
	chatname = "very long hair"

/datum/sprite_accessory/hair/balding/choppy
	name = "Choppy"
	icon_state = "hair_choppy"
	length = 1
	chatname = "choppy hair"

/datum/sprite_accessory/hair/balding/fade
	name = "Fade"
	icon_state = "hair_fade"
	length = 1
	chatname = "groomed hair"

/datum/sprite_accessory/hair/balding/fade_grown
	name = "Fade, Grown"
	icon_state = "hair_fade_grown"
	length = 1
	chatname = "groomed hair"

/datum/sprite_accessory/hair/balding/floof
	name = "Floof"
	icon_state = "hair_floof"
	length = 2
	chatname = "fluffy hair"

/datum/sprite_accessory/hair/balding/floof_short
	name = "Floof, Short"
	icon_state = "hair_floof_short"
	length = 1
	chatname = "fluffy hair"

/datum/sprite_accessory/hair/balding/hair_antenna
	name = "Hair Antenna"
	icon_state = "hair_hairantenna"
	length = 2
	chatname = "long hair"

/datum/sprite_accessory/hair/balding/hedgehog
	name = "Hedgehog"
	icon_state = "hair_hedgehog"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/keanu
	name = "Keanu"
	icon_state = "hair_keanu"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/krewcut
	name = "Krewcut"
	icon_state = "hair_krewcut"
	length = 1
	chatname = "fringe"

/datum/sprite_accessory/hair/balding/poofy5
	name = "Poofy 5"
	icon_state = "hair_poofy5"
	length = 2
	chatname = "poofy hair"

/datum/sprite_accessory/hair/balding/nia2
	name = "Nia 2"
	icon_state = "hair_nia2"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/balding/nia3
	name = "Nia 3"
	icon_state = "hair_nia3"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/balding/parted_short
	name = "Parted, Short"
	icon_state = "hair_parted_short"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/pigtails_simple
	name = "Pigtails, Simple"
	icon_state = "hair_pigtails_simple"
	length = 2
	chatname = "pigtails"

/datum/sprite_accessory/hair/balding/pixie
	name = "Pixie"
	icon_state = "hair_pixie"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/pompadour_iii
	name = "Pompadour, Pomp III"
	icon_state = "hair_pomp_iii"
	length = 3
	chatname = "pompadour"

/datum/sprite_accessory/hair/balding/ponytail_high2
	name = "Ponytail, High 2"
	icon_state = "hair_ponytail_high2"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/balding/ponytail_jenjen
	name = "Ponytail, Jenjen"
	icon_state = "hair_ponytail_jenjen"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/balding/ponytail_side5
	name = "Ponytail, Side 5"
	icon_state = "hair_ponytail_side5"
	length  = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/balding/ponytail_side6
	name = "Ponytail, Side 6"
	icon_state = "hair_ponytail_side6"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/balding/ponytail_side7
	name = "Ponytail, Side 7"
	icon_state = "hair_ponytail_side7"
	length = 2
	chatname = "braided ponytail"

/datum/sprite_accessory/hair/balding/ponytail_straight
	name = "Ponytail, Straight"
	icon_state = "hair_ponytail_straight"
	length = 2
	chatname = "ponytail"

/datum/sprite_accessory/hair/balding/protagonist
	name = "Protagonist"
	icon_state = "hair_protagonist"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/punk_sideshaved
	name = "Punk Shave, Sideshaved"
	icon_state = "hair_punk_sideshaved"
	length = 1
	chatname = "unshaved hair"		//in reference to tugging the unshaved parts

/datum/sprite_accessory/hair/balding/short_spiked
	name = "Short Spiked"
	icon_state = "hair_short_spiked"
	length = 1
	chatname = "spiked hair"

/datum/sprite_accessory/hair/balding/sidepart
	name = "Sidepart"
	icon_state = "hair_sidepart"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/sidepart_long
	name = "Sidepart, Long"
	icon_state = "hair_sidepart_long"
	length = 3
	chatname = "long hair"

/datum/sprite_accessory/hair/balding/swept
	name = "Swept"
	icon_state = "hair_swept"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/swept_short
	name = "Swept, Short"
	icon_state = "hair_swept_short"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/swept_back
	name = "Swept, Back"
	icon_state = "hair_swept_back"
	length = 1
	chatname = "short hair"

/datum/sprite_accessory/hair/balding/superbowl
	name = "Bowl, Superbowl"
	icon_state = "hair_bowlcut_superbowl"
	length = 1
	chatname = "bowl cut"

/datum/sprite_accessory/hair/balding/waxed
	name = "Waxed"
	icon_state = "hair_waxed"
	chatname = "bald head"

/datum/sprite_accessory/hair/balding/wavyshoulder
	name = "Wavy Shoulder (Down)"
	icon_state = "hair_wavyshoulder_down"
	length = 2
	chatname = "wavy hair"

/datum/sprite_accessory/hair/balding/wavyshoulder_pt
	name = "Wavy Shoulder (Ponytail)"
	icon_state = "hair_wavyshoulder_up"
	length = 2
	chatname = "ponytail"

/*
/////////////////////////////////////
/  =-----------------------------=  /
/  == Hair Gradient Definitions ==  /
/  =-----------------------------=  /
/////////////////////////////////////
*/

/datum/sprite_accessory/hair_gradients
	icon = 'icons/mob/hair_gradients.dmi'
	species_allowed = list(/datum/species/human,/datum/species/human/offworlder,/datum/species/machine/shell)

/datum/sprite_accessory/hair_gradients/none
	name = "None"
	icon_state = "none"
	species_allowed = list(/datum/species/human,/datum/species/human/offworlder,/datum/species/machine/shell,/datum/species/machine/shell/rogue,/datum/species/zombie)

/datum/sprite_accessory/hair_gradients/fade_up
	name = "Fade (Up)"
	icon_state = "fadeup"

/datum/sprite_accessory/hair_gradients/fade_down
	name = "Fade (Down)"
	icon_state = "fadedown"

/datum/sprite_accessory/hair_gradients/fade_right
	name = "Fade (Right)"
	icon_state = "faderight"

/datum/sprite_accessory/hair_gradients/fade_left
	name = "Fade (Left)"
	icon_state = "fadeleft"

/datum/sprite_accessory/hair_gradients/vertical_split_right
	name = "Vertical Split (Right)"
	icon_state = "vsplit_right"

/datum/sprite_accessory/hair_gradients/vertical_split_left
	name = "Vertical Split (Left)"
	icon_state = "vsplit_left"

/datum/sprite_accessory/hair_gradients/horizontal
	name = "Horizontal Split"
	icon_state = "hsplit"

/datum/sprite_accessory/hair_gradients/short_highlights
	name = "Short Highlights"
	icon_state = "short_highlights"

/datum/sprite_accessory/hair_gradients/short_highlights/upshift
	name = "Short Highlights (+1 Upshift)"
	icon_state = "short_highlights+1"

/datum/sprite_accessory/hair_gradients/short_highlights/downshift
	name = "Short Highlights (-1 Downshift)"
	icon_state = "short_highlights-1"

/*
///////////////////////////////////
/  =---------------------------=  /
/  == Facial Hair Definitions ==  /
/  =---------------------------=  /
///////////////////////////////////
*/

/datum/sprite_accessory/facial_hair
	icon = 'icons/mob/human_face/facial_hair.dmi'
	gender = MALE // barf (unless you're a dorf, dorfs dig chix /w beards :P)
	///Should a skeleton keep this beard?
	var/keep_as_skeleton = FALSE

/datum/sprite_accessory/facial_hair/shaved
	name = "Shaved"
	icon_state = "bald"
	gender = NEUTER
	species_allowed = list(/datum/species/human,/datum/species/human/offworlder,/datum/species/machine/shell,/datum/species/machine/shell/rogue,/datum/species/zombie)

/datum/sprite_accessory/facial_hair/threeOclock
	name = "3 O'clock Shadow"
	icon_state = "facial_3oclock"

/datum/sprite_accessory/facial_hair/threeOclockstache
	name = "3 O'clock Shadow and Moustache"
	icon_state = "facial_3oclockmoustache"

/datum/sprite_accessory/facial_hair/fiveOclock
	name = "5 O'clock Shadow"
	icon_state = "facial_5oclock"

/datum/sprite_accessory/facial_hair/fiveOclockstache
	name = "5 O'clock Shadow and Moustache"
	icon_state = "facial_5oclockmoustache"

/datum/sprite_accessory/facial_hair/sevenOclock
	name = "7 O'clock Shadow"
	icon_state = "facial_7oclock"

/datum/sprite_accessory/facial_hair/sevenOclockstache
	name = "7 O'clock Shadow and Moustache"
	icon_state = "facial_7oclockmoustache"

/datum/sprite_accessory/facial_hair/threeOclockstubble
	name = "3 O'clock Stubble"
	icon_state = "facial_3oclock_stubble"

/datum/sprite_accessory/facial_hair/threeOclockstachestubble
	name = "3 O'clock Stubble and Moustache"
	icon_state = "facial_3oclockmoustache_stubble"

/datum/sprite_accessory/facial_hair/fiveOclockstubble
	name = "5 O'clock Stubble"
	icon_state = "facial_5oclock_stubble"

/datum/sprite_accessory/facial_hair/fiveOclockstachestubble
	name = "5 O'clock Stubble and Moustache"
	icon_state = "facial_5oclockmoustache_stubble"

/datum/sprite_accessory/facial_hair/sevenOclockstubble
	name = "7 O'clock Stubble"
	icon_state = "facial_7oclock_stubble"

/datum/sprite_accessory/facial_hair/sevenOclockstachestubble
	name = "7 O'clock Stubble and Moustache"
	icon_state = "facial_7oclockmoustache_stubble"

/datum/sprite_accessory/facial_hair/abe
	name = "Abraham Lincoln Beard"
	icon_state = "facial_abe"

/datum/sprite_accessory/facial_hair/biker
	name = "Biker Beard"
	icon_state = "facial_biker"

/datum/sprite_accessory/facial_hair/britstache
	name = "Britstache"
	icon_state = "facial_britstache"

/datum/sprite_accessory/facial_hair/chaplin
	name = "Square Mustache"
	icon_state = "facial_chaplin"

/datum/sprite_accessory/facial_hair/chinless
	name = "Chinless Beard"
	icon_state = "facial_chinlessbeard"

/datum/sprite_accessory/facial_hair/chinstrap
	name = "Chinstrap"
	icon_state = "facial_chinstrap"

/datum/sprite_accessory/facial_hair/croppedbeard
	name = "Full Cropped Beard"
	icon_state = "facial_croppedfullbeard"

/datum/sprite_accessory/facial_hair/dwarf
	name = "Dwarf Beard"
	icon_state = "facial_dwarf"

/datum/sprite_accessory/facial_hair/elvis
	name = "Elvis Sideburns"
	icon_state = "facial_elvis"
	species_allowed = list(/datum/species/human,/datum/species/human/offworlder,/datum/species/machine/shell,/datum/species/machine/shell/rogue,/datum/species/zombie)

/datum/sprite_accessory/facial_hair/fullbeard
	name = "Full Beard"
	icon_state = "facial_fullbeard"

/datum/sprite_accessory/facial_hair/gt
	name = "Goatee"
	icon_state = "facial_gt"

/datum/sprite_accessory/facial_hair/gt2
	name = "Goatee 2"
	icon_state = "facial_gt2"

/datum/sprite_accessory/facial_hair/gt3
	name = "Goatee 3"
	icon_state = "facial_gt3"

/datum/sprite_accessory/facial_hair/hip
	name = "Hipster Beard"
	icon_state = "facial_hip"

/datum/sprite_accessory/facial_hair/hogan
	name = "Hulk Hogan Mustache"
	icon_state = "facial_hogan" //-Neek

/datum/sprite_accessory/facial_hair/horseshoe
	name = "Horseshoe Mustache"
	icon_state = "facial_horseshoe"

/datum/sprite_accessory/facial_hair/jensen
	name = "Jensen Beard"
	icon_state = "facial_jensen"

/datum/sprite_accessory/facial_hair/longbeard
	name = "Long Beard"
	icon_state = "facial_longbeard"

/datum/sprite_accessory/facial_hair/lumberjack
	name = "Lumberjack"
	icon_state = "facial_lumberjack"

/datum/sprite_accessory/facial_hair/martial_artist
	name = "Martial Artist"
	icon_state = "facial_martialartist"

/datum/sprite_accessory/facial_hair/moonshiner
	name = "Moonshiner"
	icon_state = "facial_moonshiner"

/datum/sprite_accessory/facial_hair/mutton
	name = "Mutton Chops"
	icon_state = "facial_mutton"

/datum/sprite_accessory/facial_hair/muttonstache
	name = "Mutton Chops and Moustache"
	icon_state = "facial_muttonmus"

/datum/sprite_accessory/facial_hair/neckbeard
	name = "Neckbeard"
	icon_state = "facial_neckbeard"

/datum/sprite_accessory/facial_hair/seadog
	name = "Sea Dog"
	icon_state = "facial_seadog"

/datum/sprite_accessory/facial_hair/selleck
	name = "Selleck Mustache"
	icon_state = "facial_selleck"

/datum/sprite_accessory/facial_hair/sideburns
	name = "Sideburns"
	icon_state = "facial_sideburns"

/datum/sprite_accessory/facial_hair/tribeard
	name = "Tribeard"
	icon_state = "facial_tribeard"

/datum/sprite_accessory/facial_hair/volaju
	name = "Volaju"
	icon_state = "facial_volaju"

/datum/sprite_accessory/facial_hair/walrus
	name = "Walrus Moustache"
	icon_state = "facial_walrus"

/datum/sprite_accessory/facial_hair/watson
	name = "Watson Mustache"
	icon_state = "facial_watson"

/datum/sprite_accessory/facial_hair/wise
	name = "Wise Beard"
	icon_state = "facial_wise"

/datum/sprite_accessory/facial_hair/chinstrap2
	icon = 'icons/mob/human_face/facial_hair_multiply.dmi'
	name = "Chinstrap, Alt"
	icon_state = "facial_chinstrap_ii"
	icon_blend_mode = ICON_MULTIPLY

/datum/sprite_accessory/facial_hair/chinstrap2/stark
	name = "Stark"
	icon_state = "facial_stark"

/datum/sprite_accessory/facial_hair/chinstrap2/swire
	name = "Swire"
	icon_state = "facial_swire"

/datum/sprite_accessory/facial_hair/chinstrap2/vandyke
	name = "Van Dyke Mustache"
	icon_state = "facial_vandyke"

//ipc screens

/datum/sprite_accessory/facial_hair/ipc_screen_blank
	icon = 'icons/mob/human_face/ipc_screens.dmi'
	name = "blank IPC screen"
	icon_state = "ipc_blank"
	species_allowed = list(/datum/species/machine)
	robotize_type_required = list()
	required_organ = BP_HEAD
	gender = NEUTER

/datum/sprite_accessory/facial_hair/ipc_screen_blank/none
	name = "no IPC screen"
	icon_state = "none"
	species_allowed = list(/datum/species/machine, /datum/species/machine/bishop)
	robotize_type_required = list(PROSTHETIC_HOPLAN, PROSTHETIC_RAXUS, PROSTHETIC_INDRICUS, PROSTHETIC_SELEN)

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_blue
	name = "blue IPC screen"
	icon_state = "ipc_blue"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_breakout
	name = "breakout IPC screen"
	icon_state = "ipc_breakout"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_cancel
	name = "cancel IPC screen"
	icon_state = "ipc_cancel"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_console
	name = "console IPC screen"
	icon_state = "ipc_console"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_database
	name = "database IPC screen"
	icon_state = "ipc_database"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_eight
	name = "eight IPC screen"
	icon_state = "ipc_eight"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_eye
	name = "eye IPC screen"
	icon_state = "ipc_eye"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_goggles
	name = "goggles IPC screen"
	icon_state = "ipc_goggles"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_gol_glider
	name = "GoL glider IPC screen"
	icon_state = "ipc_gol_glider"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_green
	name = "green IPC screen"
	icon_state = "ipc_green"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_heart
	name = "heart IPC screen"
	icon_state = "ipc_heart"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_heartrate
	name = "heartrate IPC screen"
	icon_state = "ipc_heartrate"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_lumi_eyes
	name = "lumi eyes IPC screen"
	icon_state = "ipc_lumi_eyes"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_monoeye
	name = "monoeye IPC screen"
	icon_state = "ipc_monoeye"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_scren_music
	name = "music IPC screen"
	icon_state = "ipc_music"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_nature
	name = "nature IPC screen"
	icon_state = "ipc_nature"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_orange
	name = "orange IPC screen"
	icon_state = "ipc_orange"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_pink
	name = "pink IPC screen"
	icon_state = "ipc_pink"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_purple
	name = "purple IPC screen"
	icon_state = "ipc_purple"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_rainbow
	name = "rainbow IPC screen"
	icon_state = "ipc_rainbow"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_red
	name = "red IPC screen"
	icon_state = "ipc_red"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_rgb
	name = "RGB IPC screen"
	icon_state = "ipc_rgb"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_scroll
	name = "scroll IPC screen"
	icon_state = "ipc_scroll"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_shower
	name = "shower IPC screen"
	icon_state = "ipc_shower"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_smiley
	name = "smiley IPC screen"
	icon_state = "ipc_smiley"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_static
	name = "static IPC screen"
	icon_state = "ipc_static"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_static2
	name = "static2 IPC screen"
	icon_state = "ipc_static2"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_static3
	name = "static3 IPC screen"
	icon_state = "ipc_static3"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_testcard
	name = "testcard IPC screen"
	icon_state = "ipc_testcard"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_waiting
	name = "waiting IPC screen"
	icon_state = "ipc_waiting"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_yellow
	name = "yellow IPC screen"
	icon_state = "ipc_yellow"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_nanotrasen
	name = "nanotrasen IPC screen"
	icon_state = "ipc_nt"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_hephaestus
	name = "hephaestus IPC screen"
	icon_state = "ipc_heph"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_idris
	name = "idris IPC screen"
	icon_state = "ipc_idris"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_zavodskoi
	name = "zavodskoi IPC screen"
	icon_state = "ipc_zavod"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_zenghu
	name = "zeng-hu IPC screen"
	icon_state = "ipc_zenghu"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_scc
	name = "scc IPC screen"
	icon_state = "ipc_scc"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_biesel
	name = "republic of biesel IPC screen"
	icon_state = "ipc_biesel"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_sol
	name = "sol alliance IPC screen"
	icon_state = "ipc_sol"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_coalition
	name = "coalition of colonies IPC screen"
	icon_state = "ipc_coc"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_elyra
	name = "republic of elyra IPC screen"
	icon_state = "ipc_elyra"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_eridani
	name = "eridani IPC screen"
	icon_state = "ipc_eridani"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_burzsia
	name = "burzsia IPC screen"
	icon_state = "ipc_burzsia"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_tp
	name = "trinary perfection IPC screen"
	icon_state = "ipc_tp"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_gd
	name = "golden deep IPC screen"
	icon_state = "ipc_gd"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_slot_machine
	name = "slot machine IPC screen"
	icon_state = "ipc_slotmachine"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_confirm
	name = "confirm IPC screen"
	icon_state = "ipc_confirm"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_orion
	name = "orion express IPC screen"
	icon_state = "ipc_orion"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_konyang
	name = "konyang IPC screen"
	icon_state = "ipc_konyang"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_mictlan
	name = "mictlan IPC screen"
	icon_state = "ipc_mictlan"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_himeo
	name = "himean globe IPC screen"
	icon_state = "ipc_himeo"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_himeo2
	name = "himeo IPC screen"
	icon_state = "ipc_himeo2"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_xanu
	name = "xanu IPC screen"
	icon_state = "ipc_xanu"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_xanu2
	name = "xanan banner IPC screen"
	icon_state = "ipc_xanu2"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_assunzione
	name = "assunzione IPC screen"
	icon_state = "ipc_assunzione"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_luceism
	name = "luceist eye IPC screen"
	icon_state = "ipc_luceism"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_caution
	name = "caution sign IPC screen"
	icon_state = "ipc_caution"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_caution2
	name = "black caution sign IPC screen"
	icon_state = "ipc_caution2"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_face
	name = "face IPC screen"
	icon_state = "ipc_face"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_phalanx
	name = "Ve'katak Phalanx IPC screen"
	icon_state = "ipc_phalanx"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_facecig
	name = "cigarette IPC screen"
	icon_state = "ipc_facecig"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_star
	name = "star IPC screen"
	icon_state = "ipc_star"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_starinverse
	name = "inversed star IPC screen"
	icon_state = "ipc_starinverse"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_tcaf
	name = "tcaf IPC screen"
	icon_state = "ipc_tcaf"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_crosshair
	name = "crosshair IPC screen"
	icon_state = "ipc_crosshair"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_coin
	name = "coin IPC screen"
	icon_state = "ipc_coin"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_vysoka
	name = "vysoka IPC screen"
	icon_state = "ipc_vysoka"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_ouroboros
	name = "ouroboros IPC screen"
	icon_state = "ipc_ouroboros"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_valkyrie
	name = "valkyrie IPC screen"
	icon_state = "ipc_valkyrie"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_gibson
	name = "New Gibson IPC screen"
	icon_state = "ipc_gibson"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_temple
	name = "Templeism IPC screen"
	icon_state = "ipc_temple"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_orbit
	name = "orbit IPC screen"
	icon_state = "ipc_orbit"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_orbit2
	name = "orbit2 IPC screen"
	icon_state = "ipc_orbit2"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_screen_question_mark
	name = "question mark IPC screen"
	icon_state = "ipc_question"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_green_eyes
	name = "green eyes IPC screen"
	icon_state = "ipc_green_eyes"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_red_eyes
	name = "red eyes IPC screen"
	icon_state = "ipc_red_eyes"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_yellow_eyes
	name = "yellow eyes IPC screen"
	icon_state = "ipc_yellow_eyes"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_pink_eyes
	name = "pink eyes IPC screen"
	icon_state = "ipc_pink_eyes"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_orange_eyes
	name = "orange eyes IPC screen"
	icon_state = "ipc_orange_eyes"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/ipc_blue_eyes
	name = "blue eyes IPC screen"
	icon_state = "ipc_blue_eyes"

//bishop screens
/datum/sprite_accessory/facial_hair/ipc_screen_blank/bishop
	icon = 'icons/mob/human_face/ipc_screens.dmi'
	name = "Bishop Face"
	icon_state = "bishop_face"
	species_allowed = list(/datum/species/machine/bishop)
	robotize_type_required = list()
	required_organ = BP_HEAD
	gender = NEUTER

/datum/sprite_accessory/facial_hair/ipc_screen_blank/bishop/bishop_cross
	name = "Bishop Cross"
	icon_state = "bishop_cross"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/bishop/bishop_surprise
	name = "Bishop Exclamation Mark"
	icon_state = "bishop_surprise"

/datum/sprite_accessory/facial_hair/ipc_screen_blank/bishop/siseyo_lights
	name = "Siseyo Lights"
	icon_state = "siseyo_lights"
	robotize_type_required = list(PROSTHETIC_SISEYO)

/datum/sprite_accessory/facial_hair/ipc_screen_blank/bishop/sienna_lights
	name = "Sienna Lights"
	icon_state = "sienna_lights"
	robotize_type_required = list(PROSTHETIC_SIENNA)

/datum/sprite_accessory/facial_hair/ipc_screen_blank/bishop/selen_lights
	name = "Selen Lights"
	icon_state = "selen_lights"
	robotize_type_required = list(PROSTHETIC_SELEN)

/*
////////////////////////////
/  =--------------------=  /
/  ==  Body Markings   ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/marking
	icon = 'icons/mob/human_races/markings.dmi'
	do_colouration = TRUE //Almost all of them have it, COLOR_ADD

	species_allowed = list(/datum/species/human, /datum/species/human/offworlder, /datum/species/machine/shell)

	var/body_parts = list() //A list of bodyparts this covers, TODO: port defines for organs someday
	var/is_genetic = TRUE	// If TRUE, the marking is considered genetic and is embedded into DNA.
	var/is_painted = FALSE	// If TRUE, the marking can be put on prosthetics/robolimbs.

/datum/sprite_accessory/marking/bandage_head
	name = "Bandage, head 1"
	icon_state = "bandage1"
	body_parts = list(BP_HEAD)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_head/head_2
	name = "Bandage, head 2"
	icon_state= "bandage2"

/datum/sprite_accessory/marking/bandage_head/head_3
	name = "Bandage, head 3"
	icon_state= "bandage3"

/datum/sprite_accessory/marking/bandage_chest
	name = "Bandage, chest 1"
	icon_state = "bandage1"
	body_parts = list(BP_CHEST)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_chest/chest_2
	name= "Bandage, chest 2"
	icon_state = "bandage2"

/datum/sprite_accessory/marking/bandage_chest/chest_3
	name= "Bandage, chest 3"
	icon_state = "bandage3"

/datum/sprite_accessory/marking/bandage_groin
	name = "Bandage, groin 1"
	icon_state = "bandage1"
	body_parts = list(BP_GROIN)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_groin/groin_2
	name= "Bandage, groin 2"
	icon_state = "bandage2"

/datum/sprite_accessory/marking/bandage_groin/groin_3
	name= "Bandage, groin 3"
	icon_state = "bandage3"

/datum/sprite_accessory/marking/bandage_l_arm
	name = "Bandage, left arm 1"
	icon_state = "bandage1"
	body_parts = list(BP_L_ARM)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_l_arm/l_arm_2
	name= "Bandage, left arm 2"
	icon_state = "bandage2"

/datum/sprite_accessory/marking/bandage_l_arm/l_arm_3
	name= "Bandage, left arm 3"
	icon_state = "bandage3"

/datum/sprite_accessory/marking/bandage_l_hand
	name = "Bandage, left hand 1"
	icon_state = "bandage1"
	body_parts = list(BP_L_HAND)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_l_hand/l_hand_2
	name= "Bandage, left hand 2"
	icon_state = "bandage2"

/datum/sprite_accessory/marking/bandage_l_hand/l_hand_3
	name= "Bandage, left hand 3"
	icon_state = "bandage3"

/datum/sprite_accessory/marking/bandage_r_arm
	name = "Bandage, right arm 1"
	icon_state = "bandage1"
	body_parts = list(BP_R_ARM)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_r_arm/r_arm_2
	name= "Bandage, right arm 2"
	icon_state = "bandage2"

/datum/sprite_accessory/marking/bandage_r_arm/r_arm_3
	name= "Bandage, right arm 3"
	icon_state = "bandage3"

/datum/sprite_accessory/marking/bandage_r_hand
	name = "Bandage, right hand 1"
	icon_state = "bandage1"
	body_parts = list(BP_R_HAND)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_r_hand/r_hand_2
	name= "Bandage, right hand 2"
	icon_state = "bandage2"

/datum/sprite_accessory/marking/bandage_r_hand/r_hand_3
	name= "Bandage, right hand 3"
	icon_state = "bandage3"

/datum/sprite_accessory/marking/bandage_l_leg
	name = "Bandage, left leg 1"
	icon_state = "bandage1"
	body_parts = list(BP_L_LEG)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_l_leg/l_leg_2
	name= "Bandage, left leg 2"
	icon_state = "bandage2"

/datum/sprite_accessory/marking/bandage_l_leg/l_leg_3
	name= "Bandage, left leg 3"
	icon_state = "bandage3"

/datum/sprite_accessory/marking/bandage_l_foot
	name = "Bandage, left foot 1"
	icon_state = "bandage1"
	body_parts = list(BP_L_FOOT)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_l_foot/l_foot_2
	name= "Bandage, left foot 2"
	icon_state = "bandage2"

/datum/sprite_accessory/marking/bandage_l_foot/l_foot_3
	name= "Bandage, left foot 3"
	icon_state = "bandage3"

/datum/sprite_accessory/marking/bandage_r_leg
	name = "Bandage, right leg 1"
	icon_state = "bandage1"
	body_parts = list(BP_R_LEG)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_r_leg/r_leg_2
	name= "Bandage, right leg 2"
	icon_state = "bandage2"

/datum/sprite_accessory/marking/bandage_r_leg/r_leg_3
	name= "Bandage, right leg 3"
	icon_state = "bandage3"

/datum/sprite_accessory/marking/bandage_r_foot
	name = "Bandage, right foot 1"
	icon_state = "bandage1"
	body_parts = list(BP_R_FOOT)
	is_genetic = FALSE

/datum/sprite_accessory/marking/bandage_r_foot/r_foot_2
	name= "Bandage, right foot 2"
	icon_state = "bandage2"

/datum/sprite_accessory/marking/bandage_r_foot/r_foot_3
	name= "Bandage, right foot 3"
	icon_state = "bandage3"

/datum/sprite_accessory/marking/heterochromia
	name = "Heterochromia (Right eye)"
	icon_state = "heterochromia"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_scalpports
	name = "Augment (Scalp Ports)"
	icon_state = "aug_scalpports"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_scalpports/vertex_left
	name = "Augment (Scalp Port, Vertex Left)"
	icon_state = "aug_vertexport_l"

/datum/sprite_accessory/marking/aug_scalpports/vertex_right
	name = "Augment (Scalp Port, Vertex Right)"
	icon_state = "aug_vertexport_r"

/datum/sprite_accessory/marking/aug_scalpports/occipital_left
	name = "Augment (Scalp Port, Occipital Left)"
	icon_state = "aug_occipitalport_l"

/datum/sprite_accessory/marking/aug_scalpports/occipital_right
	name = "Augment (Scalp Port, Occipital Right)"
	icon_state = "aug_occipitalport_r"

/datum/sprite_accessory/marking/aug_scalpportsdiode
	name = "Augment (Scalp Ports Diode)"
	icon_state = "aug_scalpportsdiode"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_scalpportsdiode/vertex_left
	name = "Augment (Scalp Port Diode, Vertex Left )"
	icon_state = "aug_vertexportdiode_l"

/datum/sprite_accessory/marking/aug_scalpportsdiode/vertex_right
	name = "Augment (Scalp Port Diode, Vertex Right)"
	icon_state = "aug_vertexportdiode_r"

/datum/sprite_accessory/marking/aug_scalpportsdiode/occipital_left
	name = "Augment (Scalp Port Diode, Occipital Left)"
	icon_state = "aug_occipitalportdiode_l"

/datum/sprite_accessory/marking/aug_scalpportsdiode/occipital_right
	name = "Augment (Scalp Port Diode, Occipital Right)"
	icon_state = "aug_occipitalportdiode_r"

/datum/sprite_accessory/marking/aug_backside_left
	name = "Augment (Backside Left, Head)"
	icon_state = "aug_backside_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_backside_left/side_diode
	name = "Augment (Backside Left Diode, Head)"
	icon_state = "aug_sidediode_l"

/datum/sprite_accessory/marking/aug_backside_right
	name = "Augment (Backside Right, Head)"
	icon_state = "aug_backside_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_backside_right/side_diode
	name = "Augment (Backside Right Diode, Head)"
	icon_state = "aug_sidediode_r"

/datum/sprite_accessory/marking/aug_side_deunan_left
	name = "Augment (Deunan, Side Left)"
	icon_state = "aug_sidedeunan_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_side_deunan_right
	name = "Augment (Deunan, Side Right)"
	icon_state = "aug_sidedeunan_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_side_kuze_left
	name = "Augment (Kuze, Side Left)"
	icon_state = "aug_sidekuze_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_side_kuze_left/side_diode
	name = "Augment (Kuze Diode, Side Left)"
	icon_state = "aug_sidekuzediode_l"

/datum/sprite_accessory/marking/aug_side_kuze_right
	name = "Augment (Kuze, Side Right)"
	icon_state = "aug_sidekuze_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_side_kuze_right/side_diode
	name = "Augment (Kuze Diode, Side Right)"
	icon_state = "aug_sidekuzediode_r"

/datum/sprite_accessory/marking/aug_side_kinzie_left
	name = "Augment (Kinzie, Side Left)"
	icon_state = "aug_sidekinzie_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_side_kinzie_right
	name = "Augment (Kinzie, Side Right)"
	icon_state = "aug_sidekinzie_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_side_shelly_left
	name = "Augment (Shelly, Side Left)"
	icon_state = "aug_sideshelly_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_side_shelly_right
	name = "Augment (Shelly, Side Right)"
	icon_state = "aug_sideshelly_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_chestports
	name = "Augment (Chest Ports)"
	icon_state = "aug_chestports"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/aug_abdomenports
	name = "Augment (Abdomen Ports)"
	icon_state = "aug_abdomenports"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/aug_lowerjaw
	name = "Augment (Lower Jaw)"
	icon_state = "aug_lowerjaw"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_headcase
	name = "Augment (Headcase)"
	icon_state = "aug_headcase"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/aug_headcaselight
	name = "Augment (Headcase, Light)"
	icon_state = "aug_headcaselight"
	body_parts = list(BP_HEAD)


/datum/sprite_accessory/marking/backstripe
	name = "Back Stripe"
	icon_state = "backstripe"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/backstripe/spinemarks
	name = "Back Stripe Marks"
	icon_state = "backstripemarks"

/datum/sprite_accessory/marking/bands
	name = "Color Bands (All)"
	icon_state = "bands"
	body_parts = list(BP_L_LEG, BP_R_LEG, BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_GROIN, BP_CHEST)

/datum/sprite_accessory/marking/bands/chest
	name = "Color Bands (Torso)"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/bands/groin
	name = "Color Bands (Groin)"
	body_parts = list(BP_GROIN)

/datum/sprite_accessory/marking/bands/left_arm
	name = "Color Bands (Left Arm)"
	body_parts = list(BP_L_ARM)

/datum/sprite_accessory/marking/bands/right_arm
	name = "Color Bands (Right Arm)"
	body_parts = list(BP_R_ARM)

/datum/sprite_accessory/marking/bands/left_hand
	name = "Color Bands (Left Hand)"
	body_parts = list(BP_L_HAND)

/datum/sprite_accessory/marking/bands/right_hand
	name = "Color Bands (Right Hand)"
	body_parts = list(BP_R_HAND)

/datum/sprite_accessory/marking/bands/left_leg
	name = "Color Bands (Left Leg)"
	body_parts = list(BP_L_LEG)

/datum/sprite_accessory/marking/bands/right_leg
	name = "Color Bands (Right Leg)"
	body_parts = list(BP_R_LEG)

/datum/sprite_accessory/marking/bands/left_foot_human
	name = "Color Bands (Left Foot)"
	icon_state = "bandshuman"
	body_parts = list(BP_L_FOOT)

/datum/sprite_accessory/marking/bands/right_foot_human
	name = "Color Bands (Right Foot)"
	icon_state = "bandshuman"
	body_parts = list(BP_R_FOOT)

/datum/sprite_accessory/marking/bandsface_human
	name = "Color Bands (Face)"
	icon_state = "bandshumanface"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/bindi
	name = "Bindi"
	icon_state = "bindi"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/blush
	name = "Blush"
	icon_state= "blush"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/cheekspot_left
	name = "Cheek Spot (Left Cheek)"
	icon_state = "cheekspot_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/cheekspot_right
	name = "Cheek Spot (Right Cheek)"
	icon_state = "cheekspot_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/cheshire_left
	name = "Cheshire (Left Cheek)"
	icon_state = "cheshire_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/cheshire_right
	name = "Cheshire (Right Cheek)"
	icon_state = "cheshire_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/crow_left
	name = "Crow Mark (Left Eye)"
	icon_state = "crow_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/crow_right
	name = "Crow Mark (Right Eye)"
	icon_state = "crow_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ear_left
	name = "Ear Cover (Left)"
	icon_state = "ear_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/ear_right
	name = "Ear Cover (Right)"
	icon_state = "ear_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/eyestripe
	name = "Eye Stripe"
	icon_state = "eyestripe"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/eyecorner_left
	name = "Eye Corner Left"
	icon_state = "eyecorner_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/eyecorner_right
	name = "Eye Corner Right"
	icon_state = "eyecorner_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/eyelash_left
	name = "Eyelash Left"
	icon_state = "eyelash_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/eyebrows
	name = "Eyebrows"
	icon_state = "eyebrows"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/unibrow
	name = "Unibrow"
	icon_state = "unibrow"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/eyelash_right
	name = "Eyelash Right"
	icon_state = "eyelash_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/lips
	name = "Lips"
	icon_state = "lips"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/lipcorner_left
	name = "Lip Corner Left"
	icon_state = "lipcorner_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/lipcorner_right
	name = "Lip Corner Right"
	icon_state = "lipcorner_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/lowercheek_left
	name = "Lower Cheek Left"
	icon_state = "lowercheek_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/lowercheek_right
	name = "Lower Cheek Right"
	icon_state = "lowercheek_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/neck
	name = "Neck Cover"
	icon_state = "neck"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/neckthick
	name = "Neck Cover (Thick)"
	icon_state = "neckthick"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/nosestripe
	name = "Nose Stripe"
	icon_state = "nosestripe"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/nosetape
	name = "Nose Tape"
	icon_state = "nosetape"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/scar_chest
	name = "Scar, Chest"
	icon_state = "surgicalscar"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/scar_chest_left
	name = "Scar, Chest Left"
	icon_state = "chestscar1"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/scar_chest_right
	name = "Scar, Chest Right"
	icon_state = "chestscar2"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/scratch_abdomen_left
	name = "Scratch, Abdomen Left"
	icon_state = "scratch_abdomen_l"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/scratch_abdomen_right
	name = "Scratch, Abdomen Right"
	icon_state = "scratch_abdomen_r"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/scratch_abdomen_small_left
	name = "Scratch, Abdomen Small Left"
	icon_state = "scratch_abdomensmall_l"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/scratch_abdomen_small_right
	name = "Scratch, Abdomen Small Right"
	icon_state = "scratch_abdomensmall_r"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/scratch_back
	name = "Scratch, Back"
	icon_state = "scratch_back"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/scratch_chest_left
	name = "Scratch, Chest (Left)"
	icon_state = "scratch_chest_l"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/scratch_chest_right
	name = "Scratch, Chest (Right)"
	icon_state = "scratch_chest_r"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_belly
	name = "Tattoo (Belly)"
	icon_state = "tat_belly"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_campbell_leftarm
	name = "Tattoo (Campbell, Left Arm)"
	icon_state = "tat_campbell"
	body_parts = list(BP_L_ARM)

/datum/sprite_accessory/marking/tat_campbell_rightarm
	name = "Tattoo (Campbell, Right Arm)"
	icon_state = "tat_campbell"
	body_parts= list(BP_R_ARM)

/datum/sprite_accessory/marking/tat_campbell_leftleg
	name = "Tattoo (Campbell, Left Leg)"
	icon_state = "tat_campbell"
	body_parts= list(BP_L_LEG)

/datum/sprite_accessory/marking/tat_campbell_rightleg
	name = "Tattoo (Campbell, Right Leg)"
	icon_state = "tat_campbell"
	body_parts= list(BP_R_LEG)

/datum/sprite_accessory/marking/tat_circle_back
	name = "Tattoo (Circle, Back)"
	icon_state = "tat_circle"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_circle_big_back
	name = "Tattoo (Big Circle, Back)"
	icon_state = "tat_bigcircle"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_forrest_left
	name = "Tattoo (Forrest, Left Eye)"
	icon_state = "tat_forrest_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_forrest_right
	name = "Tattoo (Forrest, Right Eye)"
	icon_state = "tat_forrest_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_harness
	name = "Tattoo (Harness, Chest)"
	icon_state = "tat_harness"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_hive
	name = "Tattoo (Hive, Back)"
	icon_state = "tat_hive"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_heart_arm
	name = "Tattoo (Heart, Left Arm)"
	icon_state = "tat_lheart"
	body_parts = list(BP_L_ARM)

/datum/sprite_accessory/marking/tat_heart_arm/right
	name = "Tattoo (Heart, Right Arm)"
	icon_state = "tat_rheart"
	body_parts = list(BP_R_ARM)

/datum/sprite_accessory/marking/tat_heart_back
	name = "Tattoo (Heart, Lower Back)"
	icon_state = "tat_heartback"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_hunter_left
	name = "Tattoo (Hunter, Left Eye)"
	icon_state = "tat_hunter_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_hunter_right
	name = "Tattoo (Hunter, Right Eye)"
	icon_state = "tat_hunter_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_jaeger_left
	name = "Tattoo (Jaeger, Left Eye)"
	icon_state = "tat_jaeger_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_jaeger_right
	name = "Tattoo (Jaeger, Right Eye)"
	icon_state = "tat_jaeger_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_kater_left
	name = "Tattoo (Kater, Left Eye)"
	icon_state = "tat_kater_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_kater_right
	name = "Tattoo (Kater, Right Eye)"
	icon_state = "tat_kater_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_lujan_left
	name = "Tattoo (Lujan, Left Eye)"
	icon_state = "tat_lujan_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_lujan_right
	name = "Tattoo (Lujan, Right Eye)"
	icon_state = "tat_lujan_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_natasha_left
	name = "Tattoo (Natasha, Left Eye)"
	icon_state = "tat_natasha_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_natasha_right
	name = "Tattoo (Natasha, Right Eye)"
	icon_state = "tat_natasha_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_nightling
	name = "Tattoo (Nightling, Back)"
	icon_state = "tat_nightling"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_silverburgh_left
	name = "Tattoo (Silverburgh, Left Leg)"
	icon_state = "tat_silverburgh"
	body_parts = list(BP_L_LEG)

/datum/sprite_accessory/marking/tat_silverburgh_right
	name = "Tattoo (Silverburgh, Right Leg)"
	icon_state = "tat_silverburgh"
	body_parts = list(BP_R_LEG)

/datum/sprite_accessory/marking/tat_spine_back
	name = "Tattoo (Spine, Back)"
	icon_state = "tat_spine"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_tamoko
	name = "Tattoo (Ta Moko, Face)"
	icon_state = "tat_tamoko"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_tiger
	name = "Tattoo (Tiger Stripes, All)"
	icon_state = "tat_tiger"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST)

/datum/sprite_accessory/marking/tat_tiger/chest
	name = "Tattoo (Tiger Stripes, Chest)"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_tiger/groin
	name = "Tattoo (Tiger Stripes, Groin)"
	body_parts = list(BP_GROIN)

/datum/sprite_accessory/marking/tat_tiger/left_arm
	name = "Tattoo (Tiger Stripes, Left Arm)"
	body_parts = list(BP_L_ARM)

/datum/sprite_accessory/marking/tat_tiger/right_arm
	name = "Tattoo (Tiger Stripes, Right Arm)"
	body_parts = list(BP_R_ARM)

/datum/sprite_accessory/marking/tat_tiger/left_hand
	name = "Tattoo (Tiger Stripes, Left Hand)"
	body_parts = list(BP_L_HAND)

/datum/sprite_accessory/marking/tat_tiger/right_hand
	name = "Tattoo (Tiger Stripes, Right Hand)"
	body_parts = list(BP_R_HAND)

/datum/sprite_accessory/marking/tat_tiger/left_leg
	name = "Tattoo (Tiger Stripes, Left Leg)"
	body_parts = list(BP_L_LEG)

/datum/sprite_accessory/marking/tat_tiger/right_leg
	name = "Tattoo (Tiger Stripes, Right Leg)"
	body_parts = list(BP_R_LEG)

/datum/sprite_accessory/marking/tat_tiger/left_foot
	name = "Tattoo (Tiger Stripes, Left Foot)"
	body_parts = list(BP_L_FOOT)

/datum/sprite_accessory/marking/tat_tiger/right_foot
	name = "Tattoo (Tiger Stripes, Right Foot)"
	body_parts = list(BP_R_FOOT)

/datum/sprite_accessory/marking/tat_toshi_left
	name = "Tattoo (Toshi, Left Eye)"
	icon_state = "tat_toshi_l"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_toshi_right
	name = "Tattoo (Volgin, Right Eye)"
	icon_state = "tat_toshi_r"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_wings_back
	name = "Tattoo (Wings, Lower Back)"
	icon_state = "tat_wingsback"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_wings_back/big
	name = "Tattoo (Wings, Full Back)"
	icon_state = "tat_wingsbig"

/datum/sprite_accessory/marking/tat_face_ridge
	name = "Tattoo (Nose Ridge, Face)"
	icon_state = "tat_face_ridge"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_face_hunter
	name = "Tattoo (Hunter Marks, Face)"
	icon_state = "tat_face_hunter"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/tat_armband
	name = "Tattoo (Forearm Band, R. Arm)"
	icon_state = "tat_armband"
	body_parts = list(BP_R_ARM)

/datum/sprite_accessory/marking/tat_armband/left_arm
	name = "Tattoo (Forearm Band, L. Arm)"
	body_parts = list(BP_L_ARM)

/datum/sprite_accessory/marking/tat_knuckle
	name = "Tattoo (Knuckle Tats, R. Hand)"
	icon_state = "tat_knuckle"
	body_parts = list(BP_R_HAND)

/datum/sprite_accessory/marking/tat_knuckle/left_hand
	name = "Tattoo (Knuckle Tats, L. Hand)"
	body_parts = list(BP_L_HAND)

/datum/sprite_accessory/marking/tat_collarbone
	name = "Tattoo (Collarbone, Chest)"
	icon_state = "tat_laurel"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_pecs
	name = "Tattoo (Pectoral Lines, Chest)"
	icon_state = "tat_pecs"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_barcode
	name = "Tattoo (Barcode, Neck)"
	icon_state = "tat_neckcode"
	body_parts = list(BP_CHEST, BP_HEAD)

/datum/sprite_accessory/marking/tat_barcode/left_leg
	name = "Tattoo (Barcode, Left Leg)"
	icon_state = "tat_legcode"
	body_parts = list(BP_L_LEG)

/datum/sprite_accessory/marking/tat_barcode/right_leg
	name = "Tattoo (Barcode, Right Leg)"
	icon_state = "tat_legcode"
	body_parts = list(BP_R_LEG)

/datum/sprite_accessory/marking/tat_moon
	name = "Tattoo (Moon, Left Chest)"
	icon_state = "tat_moonleft"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_moon/right
	name = "Tattoo (Moon, Right Chest)"
	icon_state = "tat_moonright"

/datum/sprite_accessory/marking/tat_gang
	name = "Tattoo (Gang Mark, Upper Back)"
	icon_state = "tat_gang1"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_gang/middle
	name = "Tattoo (Gang Mark, Middle Back)"
	icon_state = "tat_gang2"

/datum/sprite_accessory/marking/tat_gang/right
	name = "Tattoo (Gang Mark, Right Back)"
	icon_state = "tat_gang3"

/datum/sprite_accessory/marking/tat_snake
	name = "Tattoo (Snake Colorable, R. Arm)"
	icon_state = "tat_snake_col"
	body_parts = list(BP_R_ARM)

/datum/sprite_accessory/marking/tat_snake/green
	name = "Tattoo (Snake Green, R. Arm)"
	icon_state = "tat_snake"
	do_colouration = FALSE

/datum/sprite_accessory/marking/tat_snake/left
	name = "Tattoo (Snake Colorable, L. Arm)"
	icon_state = "tat_snake_col"
	body_parts = list(BP_L_ARM)

/datum/sprite_accessory/marking/tat_snake/left/green
	name = "Tattoo (Snake Green, L. Arm)"
	icon_state = "tat_snake"
	do_colouration = FALSE

/datum/sprite_accessory/marking/tat_serpent
	name = "Tattoo (Red Serpent, Chest)"
	icon_state = "tat_serpent"
	body_parts = list(BP_CHEST, BP_GROIN)
	do_colouration = FALSE

/datum/sprite_accessory/marking/tat_rose
	name = "Tattoo (Roses, L. Leg)"
	icon_state = "tat_rose"
	body_parts = list(BP_L_LEG)
	do_colouration = FALSE

/datum/sprite_accessory/marking/tat_rose/right_leg
	name = "Tattoo (Roses, R. Leg)"
	icon_state = "tat_rose"
	body_parts = list(BP_R_LEG)

/datum/sprite_accessory/marking/tat_rose/left_arm
	name = "Tattoo (Roses, L. Arm)"
	icon_state = "tat_rose"
	body_parts = list(BP_L_ARM)

/datum/sprite_accessory/marking/tat_rose/right_arm
	name = "Tattoo (Roses, R. Arm)"
	icon_state = "tat_rose"
	body_parts = list(BP_R_ARM)

/datum/sprite_accessory/marking/tat_nanotrasen
	name = "Tattoo (NanoTrasen, Chest)"
	icon_state = "tat_nt"
	body_parts = list(BP_CHEST)
	do_colouration = FALSE

/datum/sprite_accessory/marking/tat_heartbreak
	name = "Tattoo (Heart and Sword, Back)"
	icon_state = "tat_heartbreaker"
	body_parts = list(BP_CHEST, BP_GROIN)
	do_colouration = FALSE

/datum/sprite_accessory/marking/tat_heartthorn
	name = "Tattoo (Heart and Thorns, Back)"
	icon_state = "tat_thornheart"
	body_parts = list(BP_CHEST)
	do_colouration = FALSE

/datum/sprite_accessory/marking/tat_koi
	name = "Tattoo (Koi, Full Torso)"
	icon_state = "tat_koi"
	body_parts = list(BP_CHEST, BP_GROIN)
	do_colouration = FALSE

/datum/sprite_accessory/marking/tat_koi/back
	name = "Tattoo (Koi, Back)"
	icon_state = "tat_koi_back"

/datum/sprite_accessory/marking/tat_koi/left_leg
	name = "Tattoo (Koi, L. Leg)"
	body_parts = list(BP_L_LEG)

/datum/sprite_accessory/marking/tat_koi/right_leg
	name = "Tattoo (Koi, R. Leg)"
	body_parts = list(BP_R_LEG)

/datum/sprite_accessory/marking/tat_koi/left_arm
	name = "Tattoo (Koi, L. Arm)"
	body_parts = list(BP_L_ARM)

/datum/sprite_accessory/marking/tat_koi/right_arm
	name = "Tattoo (Koi, R. Arm)"
	body_parts = list(BP_R_ARM)

/datum/sprite_accessory/marking/tigerhead
	name = "Tiger Stripes (Head, Minor)"
	icon_state = "tigerhead"
	body_parts = list(BP_HEAD)

// Baseline markings.
/datum/sprite_accessory/marking/baseline_head
	name = "Baseline - Raxus Primary Colors"
	icon = 'icons/mob/human_races/markings_baseline.dmi'
	icon_state = "raxus_primary"
	icon_blend_mode = ICON_MULTIPLY
	is_painted = TRUE
	body_parts = list(BP_HEAD)
	robotize_type_required = list(PROSTHETIC_RAXUS)

/datum/sprite_accessory/marking/baseline_head/lights
	name = "Baseline - Raxus Head Lights"
	icon_state = "raxus_lights"

/datum/sprite_accessory/marking/baseline_head/indricus
	name = "Baseline - Indricus Primary Colors"
	icon_state = "indricus_primary"
	robotize_type_required = list(PROSTHETIC_INDRICUS)

/datum/sprite_accessory/marking/baseline_head/indricus/lights
	name = "Baseline - Indricus Lights"
	icon_state = "indricus_lights"

/datum/sprite_accessory/marking/baseline_head/hoplan
	name = "Baseline - Hoplan Primary Colors"
	icon_state = "hoplan_primary"
	robotize_type_required = list(PROSTHETIC_HOPLAN)

/datum/sprite_accessory/marking/baseline_color
	name = "Baseline - Primary Colors"
	icon = 'icons/mob/human_races/markings_baseline.dmi'
	icon_state = "machine_primary"
	icon_blend_mode = ICON_MULTIPLY
	is_painted = TRUE
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM,BP_GROIN,BP_CHEST)

/datum/sprite_accessory/marking/baseline_color/arm
	name = "Baseline - Primary Arm Colors"
	body_parts = list(BP_R_ARM,BP_L_ARM,BP_R_HAND,BP_L_HAND)

/datum/sprite_accessory/marking/baseline_color/leg
	name = "Baseline - Primary Leg Colors"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_R_LEG,BP_L_LEG)

/datum/sprite_accessory/marking/baseline_color/head
	name = "Baseline - Primary Head Colors"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/baseline_color/chest
	name = "Baseline - Primary Chest Colors"
	body_parts = list(BP_GROIN,BP_CHEST)

//bishop
/datum/sprite_accessory/marking/bishop_lights
	name = "Bishop - Lights Colour"
	icon = 'icons/mob/human_races/markings_bishop.dmi'
	icon_state = "bishop_lights"
	icon_blend_mode = ICON_MULTIPLY
	is_painted = TRUE
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_ARM,BP_R_ARM,BP_CHEST,BP_HEAD)
	robotize_type_required = list(PROSTHETIC_BC)

/datum/sprite_accessory/marking/bishop_lights/bishop_mask
	name = "Bishop - Face Mask"
	icon_state = "bishop_mask"
	do_colouration = FALSE
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/bishop_lights/bishop_mask/bishop_triangular_mask
	name = "Bishop - Triangular Face Mask"
	icon_state = "bishop_triangular_mask"


/datum/sprite_accessory/marking/bishop_lights/selen
	name = "Bishop - Selen Primary Colors"
	icon_state = "selen_primary"
	body_parts = list(BP_HEAD)
	robotize_type_required = list(PROSTHETIC_SELEN)

/datum/sprite_accessory/marking/bishop_lights/bishop_mask/sienna
	name = "Bishop - Sienna Primary Colors"
	icon_state = "sienna_primary"
	body_parts = list(BP_HEAD)
	robotize_type_required = list(PROSTHETIC_SIENNA)

/datum/sprite_accessory/marking/bishop_lights/siseyo
	name = "Bishop - Siseyo Primary Colors"
	icon_state = "siseyo_primary"
	body_parts = list(BP_HEAD)
	robotize_type_required = list(PROSTHETIC_SISEYO)

/datum/sprite_accessory/marking/bishop_lights/bishop_panels
	name = "Bishop - Full Body Panel Colors"
	icon_state = "bishop_panels"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM,BP_CHEST,BP_HEAD)

/datum/sprite_accessory/marking/bishop_lights/bishop_head
	name = "Bishop - Head Panel Colors"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/bishop_lights/bishop_legs
	name = "Bishop - Leg Panel Colors"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)

/datum/sprite_accessory/marking/bishop_lights/bishop_arms
	name = "Bishop - Arm Panel Colors"
	body_parts = list(BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM)

//hephaestus g1
/datum/sprite_accessory/marking/g1_panels
	name = "G1 - Full Panel Colors"
	icon = 'icons/mob/human_races/markings_industrial.dmi'
	icon_state = "g1_primary"
	icon_blend_mode = ICON_MULTIPLY
	is_painted = TRUE
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM,BP_GROIN,BP_CHEST,BP_HEAD)
	robotize_type_required = list(PROSTHETIC_IND)

/datum/sprite_accessory/marking/g1_panels/g1_head
	name = "G1 - Head Panel Colors"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/g1_panels/g1_legs
	name = "G1 - Leg Panel Colors"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)

/datum/sprite_accessory/marking/g1_panels/g1_arms
	name = "G1 - Arm Panel Colors"
	body_parts = list(BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM)

/datum/sprite_accessory/marking/g1_panels/g1_lights
	name = "G1 - Lights Color"
	icon_state = "g1_lights"
	body_parts = list(BP_CHEST,BP_HEAD)

//hephaestus g2
/datum/sprite_accessory/marking/g2_panels
	name = "G2 - Full Panel Colors"
	icon = 'icons/mob/human_races/markings_hephaestus.dmi'
	icon_state = "g2_primary"
	icon_blend_mode = ICON_MULTIPLY
	is_painted = TRUE
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM,BP_GROIN,BP_CHEST,BP_HEAD)
	robotize_type_required = list(PROSTHETIC_HI)

/datum/sprite_accessory/marking/g2_panels/g2_head
	name = "G2 - Head Panel Colors"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/g2_panels/g2_legs
	name = "G2 - Leg Panel Colors"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)

/datum/sprite_accessory/marking/g2_panels/g2_arms
	name = "G2 - Arm Panel Colors"
	body_parts = list(BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM)

/datum/sprite_accessory/marking/g2_panels/g2_lights
	name = "G2 - Lights Color"
	icon_state = "g2_lights"
	body_parts = list(BP_L_ARM,BP_R_ARM,BP_L_LEG,BP_R_LEG,BP_GROIN,BP_CHEST,BP_HEAD)

//zeng-hu mobility frame
/datum/sprite_accessory/marking/zeng_panels
	name = "Zeng-Hu - Full Panel Colors"
	icon = 'icons/mob/human_races/markings_zenghu.dmi'
	icon_state = "zeng_primary"
	icon_blend_mode = ICON_MULTIPLY
	is_painted = TRUE
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM,BP_GROIN,BP_CHEST,BP_HEAD)
	robotize_type_required = list(PROSTHETIC_ZH)

/datum/sprite_accessory/marking/zeng_panels/zeng_head
	name = "Zeng-Hu - Head Panel Colors"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/zeng_panels/zeng_legs
	name = "Zeng-Hu - Leg Panel Colors"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)

/datum/sprite_accessory/marking/zeng_panels/zeng_arms
	name = "Zeng-Hu - Arm Panel Colors"
	body_parts = list(BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM)

/datum/sprite_accessory/marking/zeng_panels/zeng_lights
	name = "Zeng-Hu - Lights Color"
	icon_state = "zeng_lights"
	body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM,BP_CHEST,BP_HEAD)

//xion
/datum/sprite_accessory/marking/xion_panels
	name = "Xion - Full Panel Colors"
	icon = 'icons/mob/human_races/markings_xion.dmi'
	icon_state = "xion_primary"
	icon_blend_mode = ICON_MULTIPLY
	is_painted = TRUE
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM,BP_GROIN,BP_CHEST,BP_HEAD)
	robotize_type_required = list(PROSTHETIC_XMG)

/datum/sprite_accessory/marking/xion_panels/xion_head
	name = "Xion - Head Panel Colors"
	body_parts = list(BP_HEAD)

/datum/sprite_accessory/marking/xion_panels/xion_legs
	name = "Xion - Leg Panel Colors"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)

/datum/sprite_accessory/marking/xion_panels/xion_arms
	name = "Xion - Arm Panel Colors"
	body_parts = list(BP_L_HAND,BP_R_HAND,BP_L_ARM,BP_R_ARM)

/datum/sprite_accessory/marking/xion_panels/xion_lights
	name = "Xion - Lights Color"
	icon_state = "xion_lights"
	body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_CHEST,BP_HEAD)
