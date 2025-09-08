/*********************MANUALS (BOOKS)***********************/

/obj/item/book/manual
	due_date = 0 // Game time in 1/10th seconds
	unique = 1   // 0 - Normal book, 1 - Should not be treated as normal book, unable to be copied, unable to be modified

/obj/item/book/manual/wiki
	var/sub_page = ""

/obj/item/book/manual/wiki/Initialize()
	. = ..()

	dat = {"
		<html>
		<head><style>body {overflow: hidden;}</style></head>

		<body>
		<iframe width='100%' height='97%' src="[GLOB.config.wikiurl][sub_page]&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>
	"}
