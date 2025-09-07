/obj/item/sticker
	name = "sticker"
	desc = "It's a sticker."
	icon = 'icons/obj/sticker.dmi'
	icon_state = "sticker"
	item_flags = ITEM_FLAG_NO_BLUDGEON
	w_class = WEIGHT_CLASS_TINY
	vis_flags = VIS_INHERIT_LAYER | VIS_INHERIT_DIR

	var/datum/weakref/attached
	var/list/rand_icons

/obj/item/sticker/Initialize()
	. = ..()
	if(LAZYLEN(rand_icons))
		icon_state = pick(rand_icons)

/obj/item/sticker/attack_hand(mob/user)
	if(!isliving(user) || !attached)
		return ..()

	if(user.a_intent == I_HELP)
		remove_sticker(user)
		return

	var/atom/movable/attached_atom = attached.resolve()
	if(attached_atom)
		attached_atom.attack_hand(user) // don't allow people to make sticker armor

/obj/item/sticker/attack_ranged(mob/user)
	if(!attached)
		return

	var/atom/movable/attached_atom = attached.resolve()
	if(attached_atom && user.Adjacent(attached_atom))
		attack_hand(user)

/obj/item/sticker/attackby(obj/item/attacking_item, mob/user)
	if(!attached)
		return ..()

	var/atom/movable/attached_atom = attached.resolve()
	if(attached_atom)
		attached_atom.attackby(attacking_item, user) // don't allow people to make sticker armor
		return TRUE

/obj/item/sticker/afterattack(atom/movable/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return
	if(!istype(target) || (ismob(target) && !isbot(target)))
		return
	if(!target.can_attach_sticker(user, src))
		return

	var/list/mouse_control = mouse_safe_xy(click_parameters)
	pixel_x = mouse_control["icon-x"] - 16
	pixel_y = mouse_control["icon-y"] - 16

	attach_to(user, target)

/obj/item/sticker/proc/attach_to(var/mob/user, var/atom/movable/A)
	to_chat(user, SPAN_NOTICE("You attach \the [src] to \the [A]."))
	user.drop_from_inventory(src, A)
	attached = WEAKREF(A)
	A.add_vis_contents(src)

/obj/item/sticker/proc/remove_sticker(var/mob/user)
	user.put_in_hands(src)
	var/atom/movable/attached_atom = attached.resolve()
	if(attached_atom)
		to_chat(user, SPAN_NOTICE("You remove \the [src] from \the [attached_atom]."))
		attached_atom.remove_vis_contents(src)
		attached = null

//
//generic stickers, catch all for anything that doesn't fit in another category
//
/obj/item/sticker/generic/goldstar
	name = "gold star"
	desc = "A sticker of a gold star, for those overachievers."
	icon_state = "goldstar"

/obj/item/sticker/generic/googly_eye
	name = "googly eye"
	desc = "A large googly eye sticker."
	rand_icons = list("googly", "googly1", "googly2")

/obj/item/sticker/generic/schlorgo
	name = "schlorgo sticker"
	desc = "A sticker of the Schlorgo. A penguin like animal mostly made of fat, renowned for its resistance to all blunt force."
	icon_state = "schlorgo"

/obj/item/sticker/generic/peace
	name = "peace sign sticker"
	desc = "A peace sign, white on a black background. It has become a universal symbol among humans, \
	and still remains popular among student protestors to this day."
	icon_state = "peace"

/obj/item/sticker/generic/smile
	name = "smiley face sticker"
	desc = "A yellow smiley face. A meme 500 years old, the universal sign for positivity. :)"
	icon_state = "smile"

/obj/item/sticker/generic/redheart
	name = "red heart sticker"
	desc = "A red heart outlined in white, ready to declare love, seal secrets, or just make any surface 100% more adorable."
	icon_state = "heart-red"

/obj/item/sticker/generic/smallredheart
	name = "small red heart sticker"
	desc = "The smaller counterpart to its larger sticker. Perfect for when you want to add a hint of love without overwhelming the room."
	icon_state = "smallheart-red"

/obj/item/sticker/generic/pinkheart
	name = "pink heart sticker"
	desc = "A pink heart outlined in white, perfect for spreading a little sweetness without saying a word."
	icon_state = "heart-pink"

/obj/item/sticker/generic/smallpinkheart
	name = "small pink heart sticker"
	desc = "A tiny pink heart sticker, as cute as it is subtle—because who says you can't be sweet without making a big fuss?"
	icon_state = "smallheart-pink"

/obj/item/sticker/generic/blackheart
	name = "black heart sticker"
	desc = "A black heart sticker, because nothing says 'I'm complicated' like a heart that's too cool for color."
	icon_state = "heart-black"

/obj/item/sticker/generic/smallblackheart
	name = "small black heart sticker"
	desc = "A tiny black heart sticker, just like yours—dark and a little bit harder to find than you'd like to admit."
	icon_state = "smallheart-black"

//
//Anything religion specific stickers go here.
//
/obj/item/sticker/religious
	name = "triple goddess sticker"
	desc = "A sticker of Luna, in her waxing, full, and waning phases. A symbol that can represent many neopagan religious movements."
	icon_state = "threemoongoddess"

/obj/item/sticker/religious/cross
	name = "cross sticker"
	desc = "A simple black and white sticker of a cross. As genericly christian as possible, usable by just about any branch."
	icon_state = "cross"

/obj/item/sticker/religious/crucifix
	name = "crucifix sticker"
	desc = "A golden crucifix sticker. Vampire warding power not guaranteed."
	icon_state = "crucifix"

//I'm sure there's a better name than islam for this, but it was the name on the sprite when i first got it. And its kinda funny to just call it "islam."
/obj/item/sticker/religious/islam
	name = "star and crescent sticker"
	desc = "A yellow star and crescent on a blue background. As generically islamic as possible."
	icon_state = "islam"

/obj/item/sticker/flagpole
	name = "white flagp sticker"
	desc = "A white flag on a flagpole."
	icon_state = "poleflagtemplate"
