/obj/item/reagent_containers/food/snacks/burger
	name = "burger"
	desc = "The cornerstone of every nutritious breakfast."
	icon = 'icons/obj/item/reagent_containers/food/burger.dmi'
	icon_state = "hburger"
	item_state = "burger" // Don't touch this unless you know what you're doing
	filling_color = "#D63C3C"
	center_of_mass = list("x"=16, "y"=11)
	reagents_to_add = list(/singleton/reagent/nutriment = 3, /singleton/reagent/nutriment/protein = 3)
	reagent_data = list(/singleton/reagent/nutriment = list("bun" = 3))
	bitesize = 2

// Burger + specific toppings = special burger
/obj/item/reagent_containers/food/snacks/burger/attackby(obj/item/attacking_item, mob/user)
	if(istype(attacking_item, /obj/item/reagent_containers/food/snacks/cheesewedge))// && !istype(src,/obj/item/reagent_containers/food/snacks/cheesewedge))
		new /obj/item/reagent_containers/food/snacks/burger/cheese(src)
		to_chat(user, "You make a cheeseburger.")
		qdel(attacking_item)
		qdel(src)
		return
	else if(istype(attacking_item, /obj/item/reagent_containers/food/snacks/grown)) // Burger + Moss = A "less authentic" mossburger
		var/obj/item/reagent_containers/food/snacks/grown/S = attacking_item
		if(istype(S.seed, /datum/seed/grass/moss))
			new /obj/item/reagent_containers/food/snacks/burger/moss/sad(src)
			to_chat(user, "You sprinkle some moss on top of the burger.")
			qdel(attacking_item)
			qdel(src)
		return
	else if(istype(attacking_item, /obj/item/reagent_containers/food/snacks))
		var/obj/item/reagent_containers/food/snacks/csandwich/burger/B = new(get_turf(src))
		B.attackby(attacking_item, user)
		qdel(src)
	else
		..()

/obj/item/reagent_containers/food/snacks/burger/cheese
	name = "cheeseburger"
	desc = "The cheese adds a good flavor."
	icon_state = "cheeseburger"
	center_of_mass = list("x"=16, "y"=11)
	reagents_to_add = list(/singleton/reagent/nutriment = 4, /singleton/reagent/nutriment/protein/cheese = 2, /singleton/reagent/nutriment/protein = 3)

/obj/item/reagent_containers/food/snacks/burger/fish
	name = "fillet -o- fish sandwich"
	desc = "Almost like a fish is yelling somewhere... Give me back that fillet -o- fish, give me that fish."
	icon_state = "fishburger"
	filling_color = "#FFDEFE"
	center_of_mass = list("x"=16, "y"=10)
	bitesize = 3
	reagents_to_add = list(/singleton/reagent/nutriment = 3, /singleton/reagent/nutriment/protein/seafood = 6)

/obj/item/reagent_containers/food/snacks/burger/tofu
	name = "tofu burger"
	desc = "What.. is that meat?"
	icon_state = "tofuburger"
	filling_color = "#FFFEE0"
	center_of_mass = list("x"=16, "y"=10)

	reagents_to_add = list(/singleton/reagent/nutriment = 3, /singleton/reagent/nutriment/protein/tofu = 3)
	reagent_data = list(/singleton/reagent/nutriment = list("bun" = 2))
	bitesize = 2

/obj/item/reagent_containers/food/snacks/burger/mouse
	name = "rat burger"
	desc = "Squeaky and a little furry. Do you see any cows around here, Detective?"
	icon_state = "ratburger"
	center_of_mass = list("x"=16, "y"=11)
	bitesize = 2

	reagents_to_add = list(/singleton/reagent/nutriment = 3, /singleton/reagent/nutriment/protein = 5)

/obj/item/reagent_containers/food/snacks/burger/bigbite
	name = "big bite burger"
	desc = "Forget the Big Mac. THIS is the future!"
	icon_state = "bigbiteburger"
	filling_color = "#E3D681"
	center_of_mass = list("x"=16, "y"=11)
	reagents_to_add = list(/singleton/reagent/nutriment = 4, /singleton/reagent/nutriment/protein = 10)
	reagent_data = list(/singleton/reagent/nutriment = list("buns" = 4))
	bitesize = 3

/obj/item/reagent_containers/food/snacks/burger/jelly
	name = "jelly burger"
	desc = "Culinary delight..?"
	icon_state = "jellyburger"
	filling_color = "#B572AB"
	center_of_mass = list("x"=16, "y"=11)
	reagent_data = list(/singleton/reagent/nutriment = list("buns" = 3))
	bitesize = 2

/obj/item/reagent_containers/food/snacks/burger/jelly/cherry/reagents_to_add = list(/singleton/reagent/nutriment = 3, /singleton/reagent/nutriment/cherryjelly = 5)

/obj/item/reagent_containers/food/snacks/burger/superbite
	name = "super bite burger"
	desc = "This is a mountain of a burger. FOOD!"
	icon_state = "superbiteburger"
	filling_color = "#CCA26A"
	center_of_mass = list("x"=16, "y"=3)
	reagents_to_add = list(/singleton/reagent/nutriment = 25, /singleton/reagent/nutriment/protein = 25)
	reagent_data = list(/singleton/reagent/nutriment = list("buns" = 25))
	bitesize = 10

/obj/item/reagent_containers/food/snacks/burger/nt_muffin
	name = "\improper NtMuffin"
	desc = "A NanoTrasen sponsered biscuit with egg, cheese, and sausage."
	icon_state = "nt_muffin"
	reagents_to_add = list(/singleton/reagent/nutriment = 3, /singleton/reagent/nutriment/protein = 5)
	reagent_data = list(/singleton/reagent/nutriment = list("biscuit" = 3))
	filling_color = "#FFF97D"

/obj/item/reagent_containers/food/snacks/burger/bear
	name = "bearburger"
	desc = "The solution to your unbearable hunger."
	icon_state = "bearburger"
	filling_color = "#5d5260"
	center_of_mass = list("x"=15, "y"=11)
	bitesize = 3

	reagents_to_add = list(/singleton/reagent/nutriment/protein = 10, /singleton/reagent/hyperzine = 5)

/obj/item/reagent_containers/food/snacks/burger/bacon
	name = "bacon burger"
	desc = "The cornerstone of every nutritious breakfast, now with bacon!"
	icon_state = "hburger"
	filling_color = "#D63C3C"
	center_of_mass = list("x"=16, "y"=11)
	reagents_to_add = list(/singleton/reagent/nutriment = 3, /singleton/reagent/nutriment/protein = 4)
	reagent_data = list(/singleton/reagent/nutriment = list("bun" = 2))
	bitesize = 2

/obj/item/reagent_containers/food/snacks/chickenfillet
	name = "chicken fillet sandwich"
	desc = "Fried chicken, in sandwich format. Beauty is simplicity."
	icon = 'icons/obj/item/reagent_containers/food/burger.dmi'
	icon_state = "chickenfillet"
	item_state = "burger" // Don't touch this unless you know what you're doing
	filling_color = "#E9ADFF"
	center_of_mass = list("x"=16, "y"=16)
	reagents_to_add = list(/singleton/reagent/nutriment = 4, /singleton/reagent/nutriment/protein = 8)
	reagent_data = list(/singleton/reagent/nutriment = list("buns" = 2))
	bitesize = 3

/obj/item/reagent_containers/food/snacks/chickenparm
	name = "chicken parm hero"
	desc = "Fried chicken with cheese and tomato sauce, served on a bread roll."
	icon = 'icons/obj/item/reagent_containers/food/cultural/human.dmi'
	icon_state = "parmsandwich"
	filling_color = "#7e4118"
	reagents_to_add = list(/singleton/reagent/nutriment = 4, /singleton/reagent/nutriment/protein = 4, /singleton/reagent/nutriment/protein/cheese = 2)
	reagent_data = list(/singleton/reagent/nutriment = list("tomato sauce" = 2), /singleton/reagent/nutriment/protein = list("fried chicken" = 4))
	bitesize = 3

/obj/item/reagent_containers/food/snacks/sloppyjoe
	name = "sloppy joe"
	desc = "Yum yum! Hope you brought a napkin!... or ten."
	icon = 'icons/obj/item/reagent_containers/food/burger.dmi'
	icon_state = "sloppyjoe"
	item_state = "burger" // Don't touch this unless you know what you're doing
	filling_color = "#7e4118"
	reagents_to_add = list(/singleton/reagent/nutriment = 4, /singleton/reagent/nutriment/protein = 4)
	reagent_data = list(/singleton/reagent/nutriment = list("barbecue sauce" = 5, "bun" = 5), /singleton/reagent/nutriment/protein = list("ground beef" = 5))
	bitesize = 2

/obj/item/reagent_containers/food/snacks/burger/moss
	name = "mossburger"
	desc = "A Konyanger staple, popularized by the fast food chain 'UP! Burger'. The moss is cooked along with the meat, giving it a unique flavor."
	icon_state = "mossburger"
	filling_color = "#8eb866"
	center_of_mass = list("x"=16, "y"=11)
	reagents_to_add = list(/singleton/reagent/nutriment = 4)
	reagent_data = list(/singleton/reagent/nutriment = list("mossy crunch" = 4))

/obj/item/reagent_containers/food/snacks/burger/moss/sad //The result of making the burger without cooking the moss together with the meat. Basically the same, but looks less impressive.
	desc = "A Konyanger staple, popularized by the fast food chain UP! Burger. The moss is TYPICALLY cooked along with the meat, giving it a unique flavor, but here it's just... limply sitting on top of the burger, as if added in as an afterthought. It might be fine, just don't let anyone from Konyang see this. Or the health inspector, for that matter."
	icon_state = "mossburger_sad"

/obj/item/reagent_containers/food/snacks/burger/bigbite/moss
	name = "big bite mossburger"
	desc = "Available now at an 'UP! Burger' near you!"
	icon_state = "mossburger_big"
	filling_color = "#b1a15c"
	center_of_mass = list("x"=16, "y"=11)
	reagents_to_add = list(/singleton/reagent/nutriment = 4, /singleton/reagent/nutriment/protein = 10)
	reagent_data = list(/singleton/reagent/nutriment = list("mossy crunch" = 5, "buns" = 3), /singleton/reagent/nutriment/protein = list("meat" = 5, "egg" = 3, "cheese" = 3))
	bitesize = 3
