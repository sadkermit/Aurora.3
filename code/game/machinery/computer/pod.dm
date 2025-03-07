//This file was auto-corrected by findeclaration.exe on 25.5.2012 20:42:31

/obj/machinery/computer/pod
	name = "pod launch control console"
	desc = "A control console for launching pods. Some people prefer firing Mechas."
	icon_screen = "command"
	icon_keyboard = "green_key"
	icon_keyboard_emis = "green_key_mask"
	light_color = LIGHT_COLOR_GREEN
	circuit = /obj/item/circuitboard/pod
	var/id = 1.0
	var/obj/machinery/mass_driver/connected = null
	var/timing = 0.0
	var/time = 30.0
	var/title = "Mass Driver Controls"

/obj/machinery/computer/pod/Initialize()
	..()
	. = INITIALIZE_HINT_LATELOAD

/obj/machinery/computer/pod/LateInitialize()
	for(var/obj/machinery/mass_driver/M in SSmachinery.machinery)
		if(M.id == id)
			connected = M
			return

/obj/machinery/computer/pod/proc/alarm()
	if(stat & (NOPOWER|BROKEN))
		return

	if(!( connected ))
		to_chat(viewers(null, null), "Cannot locate mass driver connector. Cancelling firing sequence!")
		return

	var/list/same_id = list()

	for(var/obj/machinery/door/blast/M in SSmachinery.machinery)
		if(M.id == id)
			same_id += M
			M.open()

	sleep(20)

	for(var/obj/machinery/mass_driver/M in SSmachinery.machinery)
		if(M.id == id)
			M.power = connected.power
			M.drive()

	sleep(50)
	for(var/mm in same_id)
		var/obj/machinery/door/blast/M = mm
		M.close()
		return
	return

/obj/machinery/computer/pod/attack_ai(var/mob/user as mob)
	if(!ai_can_interact(user))
		return
	return attack_hand(user)

/obj/machinery/computer/pod/attack_hand(var/mob/user as mob)
	if(..())
		return

	var/dat = "<HTML><BODY><TT><B>[title]</B>"
	user.set_machine(src)
	if(connected)
		var/d2
		if(timing)	//door controls do not need timers.
			d2 = "<A href='byond://?src=[REF(src)];time=0'>Stop Time Launch</A>"
		else
			d2 = "<A href='byond://?src=[REF(src)];time=1'>Initiate Time Launch</A>"
		var/second = time % 60
		var/minute = (time - second) / 60
		dat += "<HR>\nTimer System: [d2]\nTime Left: [minute ? "[minute]:" : null][second] <A href='byond://?src=[REF(src)];tp=-30'>-</A> <A href='byond://?src=[REF(src)];tp=-1'>-</A> <A href='byond://?src=[REF(src)];tp=1'>+</A> <A href='byond://?src=[REF(src)];tp=30'>+</A>"
		var/temp = ""
		var/list/L = list( 0.25, 0.5, 1, 2, 4, 8, 16 )
		for(var/t in L)
			if(t == connected.power)
				temp += "[t] "
			else
				temp += "<A href='byond://?src=[REF(src)];power=[t]'>[t]</A> "
		dat += "<HR>\nPower Level: [temp]<BR>\n<A href='byond://?src=[REF(src)];alarm=1'>Firing Sequence</A><BR>\n<A href='byond://?src=[REF(src)];drive=1'>Test Fire Driver</A><BR>\n<A href='byond://?src=[REF(src)];door=1'>Toggle Outer Door</A><BR>"
	else
		dat += "<BR>\n<A href='byond://?src=[REF(src)];door=1'>Toggle Outer Door</A><BR>"
	dat += "<BR><BR><A href='byond://?src=[REF(user)];mach_close=computer'>Close</A></TT></BODY></HTML>"
	user << browse(dat, "window=computer;size=400x500")
	add_fingerprint(usr)
	onclose(user, "computer")
	return


/obj/machinery/computer/pod/process()
	if(!operable())
		return
	if(timing)
		if(time > 0)
			time = round(time) - 1
		else
			alarm()
			time = 0
			timing = 0
		updateDialog()
	return


/obj/machinery/computer/pod/Topic(href, href_list)
	if(..())
		return 1
	if(href_list["power"])
		var/t = text2num(href_list["power"])
		t = min(max(0.25, t), 16)
		if(connected)
			connected.power = t
	if(href_list["alarm"])
		alarm()
	if(href_list["drive"])
		for(var/obj/machinery/mass_driver/M in SSmachinery.machinery)
			if(M.id == id)
				M.power = connected.power
				M.drive()

	if(href_list["time"])
		timing = text2num(href_list["time"])
	if(href_list["tp"])
		var/tp = text2num(href_list["tp"])
		time += tp
		time = min(max(round(time), 0), 120)
	if(href_list["door"])
		for(var/obj/machinery/door/blast/M in SSmachinery.machinery)
			if(M.id == id)
				if(M.density)
					M.open()
				else
					M.close()
	updateUsrDialog()
	return



/obj/machinery/computer/pod/old
	icon = 'icons/obj/library.dmi'
	icon_state = "computer"
	icon_screen = null
	name = "DoorMex Control Computer"
	title = "Door Controls"



/obj/machinery/computer/pod/old/syndicate
	name = "ProComp Executive IIc"
	desc = "Criminals often operate on a tight budget. Operates external airlocks."
	title = "External Airlock Controls"
	req_access = list(ACCESS_SYNDICATE)

/obj/machinery/computer/pod/old/syndicate/attack_hand(var/mob/user as mob)
	if(!allowed(user))
		to_chat(user, SPAN_WARNING("Access Denied"))
		return
	else
		..()

/obj/machinery/computer/pod/old/swf
	name = "Magix System IV"
	desc = "An arcane artifact that holds much magic. Running E-Knock 2.2: Sorceror's Edition"
