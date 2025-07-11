/*	Note from Carnie:
		The way datum/mind stuff works has been changed a lot.
		Minds now represent IC characters rather than following a client around constantly.

	Guidelines for using minds properly:

	-	Never mind.transfer_to(ghost). The var/current and var/original of a mind must always be of type mob/living!
		ghost.mind is however used as a reference to the ghost's corpse

	-	When creating a new mob for an existing IC character (e.g. cloning a dead guy or borging a brain of a human)
		the existing mind of the old mob should be transferred to the new mob like so:

			mind.transfer_to(new_mob)

	-	You must not assign key= or ckey= after transfer_to() since the transfer_to transfers the client for you.
		By setting key or ckey explicitly after transferring the mind with transfer_to you will cause bugs like DCing
		the player.

	-	IMPORTANT NOTE 2, if you want a player to become a ghost, use mob.ghostize() It does all the hard work for you.

	-	When creating a new mob which will be a new IC character (e.g. putting a shade in a construct or randomly selecting
		a ghost to become a xeno during an event). Simply assign the key or ckey like you've always done.

			new_mob.key = key

		The Login proc will handle making a new mob for that mobtype (including setting up stuff like mind.name). Simple!
		However if you want that mind to have any special properties like being a traitor etc you will have to do that
		yourself.

*/

/datum/mind
	var/key
	var/name				//replaces mob/var/original_name
	var/mob/living/current
	var/mob/living/original	//This is being used now, don't remove it
	var/active = 0

	var/mob/living/admin_mob_placeholder = null

	var/memory

	var/assigned_role
	var/special_role

	var/role_alt_title

	var/datum/job/assigned_job
	var/datum/faction/selected_faction

	var/list/datum/objective/objectives = list()
	var/list/datum/objective/special_verbs = list()

	var/has_been_rev = 0//Tracks if this mind has been a rev or not

	var/list/antag_datums = list()

	var/rev_cooldown = 0

	// the world.time since the mob has been brigged, or -1 if not at all
	var/brigged_since = -1

	// Custom signature data.
	var/signature
	var/signfont

	//put this here for easier tracking ingame
	var/datum/money_account/initial_account

	var/last_words
	var/ambitions

/datum/mind/New(var/key)
	src.key = key
	..()

/datum/mind/proc/handle_mob_deletion(mob/living/deleted_mob)
	if (current == deleted_mob)
		current = null

	if (original == deleted_mob)
		original = null

/datum/mind/proc/transfer_to(mob/living/new_character)
	if(!istype(new_character))
		log_world("ERROR: ## DEBUG: transfer_to(): Some idiot has tried to transfer_to( a non mob/living mob. Please inform Carn")
	var/datum/changeling/changeling = antag_datums[MODE_CHANGELING]
	var/datum/vampire/vampire = antag_datums[MODE_VAMPIRE]
	if(current)					//remove ourself from our old body's mind variable
		if(changeling)
			current.remove_changeling_powers()
			remove_verb(current, /datum/changeling/proc/EvolutionMenu)
		if(vampire)
			current.remove_vampire_powers()
		current.mind = null

		SSnanoui.user_transferred(current, new_character)
		SStgui.on_transfer(current, new_character)
		if(current.client && GLOB.ticket_panels[current.client])
			var/datum/ticket_panel/tp = GLOB.ticket_panels[current.client]
			tp.ticket_panel_window.user = new_character

	if(new_character.mind)		//remove any mind currently in our new body's mind variable
		new_character.mind.current = null

	current = new_character		//link ourself to our new body
	new_character.mind = src	//and link our new body to ourself

	if(changeling)
		new_character.make_changeling()
	if(vampire)
		new_character.make_vampire()
	if(active)
		new_character.key = key		//now transfer the key to link the client to our new body


/datum/mind/proc/store_memory(new_text)
	. = length(memory + new_text)

	if (. > MAX_PAPER_MESSAGE_LEN)
		memory = copytext(memory, . - MAX_PAPER_MESSAGE_LEN, .)
	else
		memory += "[new_text]<BR>"

/datum/mind/proc/show_memory(mob/recipient)
	var/output = "<B>[current.real_name]'s Memory</B><HR>"
	output += memory

	if(ambitions)
		output += "<HR><B>Ambitions:</B> [ambitions]<br>"

	if(objectives.len>0)
		output += "<HR><B>Objectives:</B>"

		var/obj_count = 1
		for(var/datum/objective/objective in objectives)
			output += "<B>Objective #[obj_count]</B>: [objective.explanation_text]"
			obj_count++

	/// Culture and origin may have been set while there was no mob.
	if(ishuman(recipient))
		var/mob/living/carbon/human/H = recipient
		output += "<hr><b>Culture Information:</b><br></hr>"
		if(H.culture)
			output += "Your culture is <b>[H.culture.name]</b>.<br>"
		if(H.origin)
			output += "Your origin is <b>[H.origin.name]</b>.<br>"
		if(H.religion)
			output += "Your religion is <b>[H.religion]</b>.<br>"
		if(H.accent)
			output += "Your accent is <b>[H.accent]</b>.<br>"

	var/datum/browser/memory_win = new(recipient, "memory")
	memory_win.set_content(output)
	memory_win.open()

/datum/mind/proc/edit_memory()
	if(!ROUND_IS_STARTED)
		alert("Not before round-start!", "Alert")
		return

	var/out = "<B>[name]</B>[(current&&(current.real_name!=name))?" (as [current.real_name])":""]<br>"
	out += "Mind currently owned by key: [key] [active?"(synced)":"(not synced)"]<br>"
	out += "Assigned role: [assigned_role]. <a href='byond://?src=[REF(src)];role_edit=1'>Edit</a><br>"
	out += "<hr>"
	out += "Factions and special roles:<br><table>"
	for(var/antag_type in GLOB.all_antag_types)
		var/datum/antagonist/antag = GLOB.all_antag_types[antag_type]
		out += "[antag.get_panel_entry(src)]"
	out += "</table><hr>"
	out += "<b>Objectives</b></br>"

	if(objectives && objectives.len)
		var/num = 1
		for(var/datum/objective/O in objectives)
			out += "<b>Objective #[num]:</b> [O.explanation_text] "
			if(O.completed)
				out += "(<span class='good'>complete</span>)"
			else
				out += "(<span class='warning'>incomplete</span>)"
			out += " <a href='byond://?src=[REF(src)];obj_completed=[REF(O)]'>\[toggle\]</a>"
			out += " <a href='byond://?src=[REF(src)];obj_delete=[REF(O)]'>\[remove\]</a><br>"
			num++
		out += "<br><a href='byond://?src=[REF(src)];obj_announce=1'>\[announce objectives\]</a>"

	else
		out += "None."
	out += "<br><a href='byond://?src=[REF(src)];obj_add=1'>\[add\]</a>"
	out += "<b>Ambitions:</b> [ambitions ? ambitions : "None"] <a href='byond://?src=[REF(src)];amb_edit=[REF(src)]'>\[edit\]</a></br>"
	usr << browse(HTML_SKELETON(out), "window=edit_memory[src]")

/datum/mind/Topic(href, href_list)
	if(!check_rights(R_ADMIN))	return

	if(href_list["add_antagonist"])
		var/datum/antagonist/antag = GLOB.all_antag_types[href_list["add_antagonist"]]
		if(antag)
			if(antag.add_antagonist(src, 1, 1, 0, 1, 1)) // Ignore equipment and role type for this.
				log_admin("[key_name_admin(usr)] made [key_name(src, highlight_special = 1)] into a [antag.role_text].")
			else
				to_chat(usr, SPAN_WARNING("[src] could not be made into a [antag.role_text]!"))

	else if(href_list["remove_antagonist"])
		var/datum/antagonist/antag = GLOB.all_antag_types[href_list["remove_antagonist"]]
		if(antag) antag.remove_antagonist(src)

	else if(href_list["equip_antagonist"])
		var/datum/antagonist/antag = GLOB.all_antag_types[href_list["equip_antagonist"]]
		if(antag) antag.equip(src.current)

	else if(href_list["unequip_antagonist"])
		var/datum/antagonist/antag = GLOB.all_antag_types[href_list["unequip_antagonist"]]
		if(antag) antag.unequip(src.current)

	else if(href_list["move_antag_to_spawn"])
		var/datum/antagonist/antag = GLOB.all_antag_types[href_list["move_antag_to_spawn"]]
		if(antag) antag.place_mob(src.current)

	else if (href_list["role_edit"])
		var/new_role = input("Select new role", "Assigned role", assigned_role) as null|anything in GLOB.joblist
		if (!new_role) return
		assigned_role = new_role

	else if (href_list["memory_edit"])
		var/new_memo = sanitize(input("Write new memory", "Memory", memory) as null|message)
		if (isnull(new_memo)) return
		memory = new_memo

	else if (href_list["amb_edit"])
		var/new_ambition = tgui_input_text("Enter a new ambition", "Memory", html_decode(ambitions))
		if(isnull(new_ambition))
			return
		src.ambitions = sanitize(new_ambition)
		to_chat(src.current, SPAN_WARNING("Your ambitions have been changed by higher powers, they are now: [src.ambitions]"))

	else if (href_list["obj_edit"] || href_list["obj_add"])
		var/datum/objective/objective
		var/objective_pos
		var/def_value

		if (href_list["obj_edit"])
			objective = locate(href_list["obj_edit"])
			if (!objective) return
			objective_pos = objectives.Find(objective)

			//Text strings are easy to manipulate. Revised for simplicity.
			var/temp_obj_type = "[objective.type]"//Convert path into a text string.
			def_value = copytext(temp_obj_type, 19)//Convert last part of path into an objective keyword.
			if(!def_value)//If it's a custom objective, it will be an empty string.
				def_value = "custom"

		var/new_obj_type = input("Select objective type:", "Objective type", def_value) as null|anything in list("assassinate", "debrain", "protect", "prevent", "harm", "brig", "hijack", "escape", "survive", "steal", "download", "mercenary", "capture", "absorb", "custom")
		if (!new_obj_type) return

		var/datum/objective/new_objective = null

		switch (new_obj_type)
			if ("assassinate","protect","debrain", "harm", "brig")
				//To determine what to name the objective in explanation text.
				var/objective_type_capital = uppertext(copytext(new_obj_type, 1,2))//Capitalize first letter.
				var/objective_type_text = copytext(new_obj_type, 2)//Leave the rest of the text.
				var/objective_type = "[objective_type_capital][objective_type_text]"//Add them together into a text string.

				var/list/possible_targets = list("Free objective")
				for(var/datum/mind/possible_target in SSticker.minds)
					if ((possible_target != src) && istype(possible_target.current, /mob/living/carbon/human))
						possible_targets += possible_target.current

				var/mob/def_target = null
				var/objective_list[] = list(/datum/objective/assassinate, /datum/objective/protect, /datum/objective/debrain)
				if (objective && (objective.type in objective_list) && objective.target)
					def_target = objective.target.current

				var/new_target = input("Select target:", "Objective target", def_target) as null|anything in possible_targets
				if (!new_target) return

				var/objective_path = text2path("/datum/objective/[new_obj_type]")
				var/mob/living/M = new_target
				if (!istype(M) || !M.mind || new_target == "Free objective")
					new_objective = new objective_path
					new_objective.owner = src
					new_objective.target = null
					new_objective.explanation_text = "Free objective"
				else
					new_objective = new objective_path
					new_objective.owner = src
					new_objective.target = M.mind
					new_objective.explanation_text = "[objective_type] [M.real_name], the [M.mind.special_role ? M.mind.special_role : M.mind.assigned_role]."

			if ("prevent")
				new_objective = new /datum/objective/block
				new_objective.owner = src

			if ("hijack")
				new_objective = new /datum/objective/hijack
				new_objective.owner = src

			if ("escape")
				new_objective = new /datum/objective/escape
				new_objective.owner = src

			if ("survive")
				new_objective = new /datum/objective/survive
				new_objective.owner = src

			if ("mercenary")
				new_objective = new /datum/objective/nuclear
				new_objective.owner = src

			if ("steal")
				if (!istype(objective, /datum/objective/steal))
					new_objective = new /datum/objective/steal
					new_objective.owner = src
				else
					new_objective = objective
				var/datum/objective/steal/steal = new_objective
				if (!steal.select_target())
					return

			if("download","capture","absorb")
				var/def_num
				if(objective&&objective.type==text2path("/datum/objective/[new_obj_type]"))
					def_num = objective.target_amount

				var/target_number = input("Input target number:", "Objective", def_num) as num|null
				if (isnull(target_number))//Ordinarily, you wouldn't need isnull. In this case, the value may already exist.
					return

				switch(new_obj_type)
					if("download")
						new_objective = new /datum/objective/download
						new_objective.explanation_text = "Download [target_number] research levels."
					if("capture")
						new_objective = new /datum/objective/capture
						new_objective.explanation_text = "Accumulate [target_number] capture points."
					if("absorb")
						new_objective = new /datum/objective/absorb
						new_objective.explanation_text = "Absorb [target_number] compatible genomes."
				new_objective.owner = src
				new_objective.target_amount = target_number

			if ("custom")
				var/expl = sanitize(input("Custom objective:", "Objective", objective ? objective.explanation_text : "") as text|null)
				if (!expl) return
				new_objective = new /datum/objective
				new_objective.owner = src
				new_objective.explanation_text = expl

		if (!new_objective) return

		if (objective)
			objectives -= objective
			objectives.Insert(objective_pos, new_objective)
		else
			objectives += new_objective

	else if (href_list["obj_delete"])
		var/datum/objective/objective = locate(href_list["obj_delete"])
		if(!istype(objective))	return
		objectives -= objective

	else if(href_list["obj_completed"])
		var/datum/objective/objective = locate(href_list["obj_completed"])
		if(!istype(objective))	return
		objective.completed = !objective.completed

	else if(href_list["implant"])
		var/mob/living/carbon/human/H = current

		BITSET(H.hud_updateflag, IMPLOYAL_HUD)   // updates that players HUD images so secHUD's pick up they are implanted or not.

		switch(href_list["implant"])
			if("remove")
				for(var/obj/item/implant/mindshield/loyalty/I in H.contents)
					for(var/obj/item/organ/external/organs in H.organs)
						if(I in organs.implants)
							qdel(I)
							break
				to_chat(H, SPAN_NOTICE("<font size =3><B>Your loyalty implant has been deactivated.</B></font>"))
				log_admin("[key_name_admin(usr)] has de-loyalty implanted [current].")
			if("add")
				to_chat(H, SPAN_DANGER("<font size =3>You somehow have become the recipient of a loyalty transplant, and it just activated!</font>"))
				H.implant_loyalty(H, override = TRUE)
				log_admin("[key_name_admin(usr)] has loyalty implanted [current].")

	else if (href_list["silicon"])
		BITSET(current.hud_updateflag, SPECIALROLE_HUD)
		switch(href_list["silicon"])

			if("unemag")
				var/mob/living/silicon/robot/R = current
				if (istype(R))
					R.emagged = 0
					if (R.activated(R.module.emag))
						R.set_module_active(null)
					if(R.module_state_1 == R.module.emag)
						R.module_state_1 = null
						R.contents -= R.module.emag
					else if(R.module_state_2 == R.module.emag)
						R.module_state_2 = null
						R.contents -= R.module.emag
					else if(R.module_state_3 == R.module.emag)
						R.module_state_3 = null
						R.contents -= R.module.emag
					log_admin("[key_name_admin(usr)] has unemagged [R].")

			if("unemagcyborgs")
				if (istype(current, /mob/living/silicon/ai))
					var/mob/living/silicon/ai/ai = current
					for (var/mob/living/silicon/robot/R in ai.connected_robots)
						R.emagged = 0
						if (R.module)
							if (R.activated(R.module.emag))
								R.set_module_active(null)
							if(R.module_state_1 == R.module.emag)
								R.module_state_1 = null
								R.contents -= R.module.emag
							else if(R.module_state_2 == R.module.emag)
								R.module_state_2 = null
								R.contents -= R.module.emag
							else if(R.module_state_3 == R.module.emag)
								R.module_state_3 = null
								R.contents -= R.module.emag
					log_admin("[key_name_admin(usr)] has unemagged [ai]'s Cyborgs.")

	else if (href_list["common"])
		switch(href_list["common"])
			if("undress")
				for(var/obj/item/W in current)
					current.drop_from_inventory(W)
			if("takeuplink")
				take_uplink()
				memory = null//Remove any memory they may have had.
			if("crystals")
				if (usr.client.holder.rights & R_FUN)
					var/obj/item/device/uplink/hidden/suplink = find_syndicate_uplink()
					var/crystals
					if (suplink)
						crystals = suplink.telecrystals + suplink.bluecrystals
					crystals = input("Amount of telecrystals and bluecrystals for [key]","Operative uplink", crystals) as null|num
					if (!isnull(crystals))
						if (suplink)
							suplink.telecrystals = crystals
							suplink.bluecrystals = crystals

	else if (href_list["obj_announce"])
		var/obj_count = 1
		to_chat(current, SPAN_NOTICE("Your current objectives:"))
		for(var/datum/objective/objective in objectives)
			to_chat(current, "<B>Objective #[obj_count]</B>: [objective.explanation_text]")
			obj_count++

	else if(href_list["set_psi_rank"])
		current.set_psi_rank(text2num(href_list["set_psi_rank"]))
		return
	else if(href_list["set_psi_rank_limitless"])
		var/sure = tgui_alert(usr, "Limitless is INTENTIONALLY STUPIDLY OVERPOWERED! YOU SHOULD NOT BE USING THIS WITHOUT KNOWING EXACTLY WHAT YOU'RE DOING!", \
					"Don't Get A Staff Complaint", list("I know what I'm doing!", "I fear no man. But that thing... it scares me!"))
		if(sure == "I know what I'm doing!")
			current.set_psi_rank(PSI_RANK_LIMITLESS)
		return

	edit_memory()

/datum/mind/proc/find_syndicate_uplink()
	var/list/L = current.get_contents()
	for (var/obj/item/I in L)
		if (I.hidden_uplink)
			return I.hidden_uplink
	return null

/datum/mind/proc/take_uplink()
	var/obj/item/device/uplink/hidden/H = find_syndicate_uplink()
	if(H)
		qdel(H)


// check whether this mind's mob has been brigged for the given duration
// have to call this periodically for the duration to work properly
/datum/mind/proc/is_brigged(duration)
	var/turf/T = current.loc
	if(isnull(T))
		brigged_since = -1
		return 0
	var/area/A = T.loc
	var/is_currently_brigged = 0
	if(A?.is_prison())
		is_currently_brigged = 1
		if(current.GetIdCard())
			is_currently_brigged = 0

	if(!is_currently_brigged)
		brigged_since = -1
		return 0

	if(brigged_since == -1)
		brigged_since = world.time

	return (duration <= world.time - brigged_since)

/datum/mind/proc/reset()
	assigned_role =   null
	special_role =    null
	role_alt_title =  null
	assigned_job =    null
	//faction =       null //Uncommenting this causes a compile error due to 'undefined type', fucked if I know.
	for(var/thing in antag_datums)
		QDEL_NULL(thing)
	initial_account = null
	objectives =      list()
	special_verbs =   list()
	has_been_rev =    0
	rev_cooldown =    0
	brigged_since =   -1

//Antagonist role check
/mob/living/proc/check_special_role(role)
	if(mind)
		if(!role)
			return mind.special_role
		else
			return (mind.special_role == role) ? 1 : 0
	else
		return 0

//Initialisation procs
/mob/living/proc/mind_initialize()
	if(mind)
		mind.key = key
	else
		mind = new /datum/mind(key)
		mind.original = src
		SSticker.minds += mind
	if(!mind.name)
		mind.name = real_name

	if (client)
		if (client.prefs.signature)
			mind.signature = client.prefs.signature
		if (client.prefs.signfont)
			mind.signfont = client.prefs.signfont
	mind.current = src

//HUMAN
/mob/living/carbon/human/mind_initialize()
	..()
	if(!mind.assigned_role)
		mind.assigned_role = "Assistant"	//default

//slime
/mob/living/carbon/slime/mind_initialize()
	..()
	mind.assigned_role = "slime"

//AI
/mob/living/silicon/ai/mind_initialize()
	..()
	mind.assigned_role = "AI"

//AI Shell / AI Spiderbot
/mob/living/silicon/robot/shell/mind_initialize()
	..()
	mind.assigned_role = "AI"

/mob/living/simple_animal/spiderbot/ai/mind_initialize()
	..()
	mind.assigned_role = "AI"

//BORG
/mob/living/silicon/robot/mind_initialize()
	..()
	mind.assigned_role = "Cyborg"

//PAI
/mob/living/silicon/pai/mind_initialize()
	..()
	mind.assigned_role = "pAI"
	mind.special_role = ""

//Animals
/mob/living/simple_animal/shade/mind_initialize()
	..()
	mind.assigned_role = "Shade"

/mob/living/simple_animal/construct/builder/mind_initialize()
	..()
	mind.assigned_role = "Artificer"
	mind.special_role = "Cultist"

/mob/living/simple_animal/construct/wraith/mind_initialize()
	..()
	mind.assigned_role = "Wraith"
	mind.special_role = "Cultist"

/mob/living/simple_animal/construct/armored/mind_initialize()
	..()
	mind.assigned_role = "Juggernaut"
	mind.special_role = "Cultist"

/mob/living/silicon/robot/combat/mind_initialize()
	..()
	mind.assigned_role = "Combat Robot"
	mind.special_role = "Mercenary"
