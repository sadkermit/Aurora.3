/obj/item/storage/stickersheet
	name = "sticker sheet"
	desc = "A sheet of stickers, made of vinyl material. Perfect for decorating anything and everything!"
	icon = 'icons/obj/sticker.dmi'
	icon_state = "sticker_sheet"
	item_state = "sticker_sheet"
	contained_sprite = TRUE
	display_contents_with_number = TRUE
	force = 0
	throw_speed = 1
	throw_range = 2
	w_class = WEIGHT_CLASS_SMALL
	max_w_class = WEIGHT_CLASS_TINY
	max_storage_space = DEFAULT_BOX_STORAGE
	can_hold = list(
		/obj/item/sticker
	)

/obj/item/storage/stickersheet/goldstar
	name = "gold star sticker sheet"
	starts_with = list(
		/obj/item/sticker/generic/goldstar = 12
	)

/obj/item/storage/stickersheet/googly_eye
	name = "googly eye sticker sheet"
	starts_with = list(
		/obj/item/sticker/generic/googly_eye = 12
	)

/obj/item/storage/stickersheet/generic
	name = "generic sticker sheet"
	starts_with = list(
		/obj/item/sticker/generic/schlorgo = 2,
		/obj/item/sticker/generic/peace = 2,
		/obj/item/sticker/generic/smile = 2
	)

/obj/item/storage/stickersheet/hearts
	name = "heart sticker sheet"
	starts_with = list(
		/obj/item/sticker/generic/redheart = 2,
		/obj/item/sticker/generic/smallredheart = 2,
		/obj/item/sticker/generic/pinkheart = 2,
		/obj/item/sticker/generic/smallpinkheart = 2,
		/obj/item/sticker/generic/blackheart = 2,
		/obj/item/sticker/generic/smallblackheart = 2
	)

/obj/item/storage/stickersheet/religion
	name = "religious sticker sheet"
	starts_with = list(
		/obj/item/sticker/religious = 1,
		/obj/item/sticker/religious/cross = 1,
		/obj/item/sticker/religious/crucifix = 1,
		/obj/item/sticker/religious/islam = 1
	)

/obj/item/storage/stickersheet/resistance
	name = "anti-establishment sticker sheet"
	starts_with = list(
		/obj/item/sticker/generic/peace = 2
	)
