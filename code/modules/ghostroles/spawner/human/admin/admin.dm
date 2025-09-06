/datum/ghostspawner/human/admin
	tags = list("Admin")

//Add the ability to despawn
/datum/ghostspawner/human/admin/post_spawn(mob/user)
	add_verb(user.client, /client/proc/despawn)
	return ..()

/datum/ghostspawner/human/admin/checkpointsec
	short_name = "checkpointsec"
	name = "Odin Checkpoint Security"
	desc = "Secure the Odin checkpoint. Verify the identity of everyone passing through, perform random searches on \"suspicious\" crew."

	enabled = FALSE
	spawnpoints = list("OdinCheckpoint")
	req_perms = null
	req_perms_edit = R_CCIAA
	max_count = 4

	//Vars related to human mobs
	outfit = /obj/outfit
	possible_species = list(SPECIES_HUMAN,SPECIES_IPC)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "Odin Security Officer"
	special_role = "Odin Security Officer"
	respawn_flag = null

	mob_name = null
	mob_name_prefix = "Spec. "
	mob_name_pick_message = "Pick a callsign or last-name."

/client/proc/despawn()
	set name = "Despawn"
	set desc = "Your work is done. Leave this realm."
	set category = "Special Verbs"

	var/mob/M = mob
	M.mind.special_role = null
	M.ghostize(1)
	remove_verb(src, /client/proc/despawn)
	qdel(M)



/hook/shuttle_moved/proc/setup_odin_for_shuttle(var/obj/effect/shuttle_landmark/start_location, var/obj/effect/shuttle_landmark/destination)
	if(start_location.landmark_tag != "nav_emergency_start")
		return TRUE

	if(GLOB.evacuation_controller.evacuation_type == TRANSFER_EMERGENCY)
		if(get_security_level() != "green" )
			var/datum/wifi/sender/door/wifi_sender = new("odin_arrivals_lockdown", SSghostroles)
			wifi_sender.activate("close")
			qdel(wifi_sender)

			if(prob(80))
				var/datum/ghostspawner/G = SSghostroles.get_spawner("checkpointsec")
				G.enable()
		return TRUE
	else
		if(get_security_level() == "green" && prob(70))
			var/datum/ghostspawner/G = SSghostroles.get_spawner("odinchef")
			G.enable()
			G = SSghostroles.get_spawner("odinbartender")
			G.enable()
		if(get_security_level() == "blue")
			var/datum/wifi/sender/door/wifi_sender = new("odin_arrivals_lockdown", SSghostroles)
			wifi_sender.activate("close")
			qdel(wifi_sender)

			if(prob(50))
				var/datum/ghostspawner/G = SSghostroles.get_spawner("checkpointsec")
				G.enable()
		return TRUE
