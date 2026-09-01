/singleton/scenario/cryo_outpost
	name = "OS/A-622c: Territorial Dispute"
	desc = ""
	scenario_site_id = "cryo_outpost"

	min_player_amount = 0
	min_actor_amount = 0

	scenario_announcements = /singleton/scenario_announcements/cryo_outpost

	roles = list(
		/singleton/role/cryo_outpost
	)
	default_outfit = /obj/outfit/admin/generic/cryo_outpost_crew
	actor_accesses = list(/datum/access/cryo_outpost_access)

	base_area = /area/cryo_outpost

	radio_frequency_name = "EE - Oscar Outpost"

/singleton/scenario_announcements/cryo_outpost
	horizon_announcement_title = "SCC Priority Update"
	horizon_unrestrict_landing_message = "Attention, crew. The SCCV Horizon has arrived in the OS/A-622 system to support the \
	Hephaestus Industries—sponsored colonial effort. Please refer to the 2468-08-30 Employee Update or contact your \
	supervising head of staff for further information. \
	A full-scale, priority expedition has been ordered this shift. \
	All crew are encouraged to volunteer and should notify their relevant department heads as soon as possible. \
	Volunteers should only be rejected in the most dire circumstances."

	offship_announcement_message = "Increased sector activity detected. Coordinates have been registered on the flight deck."

/singleton/role/cryo_outpost
	name = "Mercenary Team Lead"
	desc = "You are the leader of a mercenary detachment found in the outpost. Your team could have been an independent mercenary company contracted \
			to take this secret Zeng-Hu base, or you could've just found it yourselves. You are equipped with a Heavy Sol Marine's gear."
	outfit = /obj/outfit/admin/generic/cryo_outpost_crew/mercenary/leader

/singleton/role/cryo_outpost/mercenary
	name = "Mercenary"
	desc = "You are part of a mercenary detachment that has occupied this outpost - either because you were contracted by someone, or because you simply \
			found this place. Some of these Zeng-Hu secrets could sell for a pretty penny... Your creativity's the limit! You are equipped with \
			a Mercenary Freelancer's gear."
	outfit = /obj/outfit/admin/generic/cryo_outpost_crew/mercenary

/singleton/role/cryo_outpost/mercenary/medic
	name = "Mercenary Combat Medic"
	desc = "You are part of a mercenary detachment that has occupied this outpost - either because you were contracted by someone, or because you simply \
			found this place. You, unlike others, are mainly worried with keeping everyone alive. You are equipped with \
			a Mercenary Freelancer Medic's gear."
	outfit = /obj/outfit/admin/generic/cryo_outpost_crew/mercenary/medic

/singleton/role/cryo_outpost/mercenary/engineer
	name = "Mercenary Combat Engineer"
	desc = "You are part of a mercenary detachment that has occupied this outpost - either because you were contracted by someone, or because you simply \
			found this place. You, unlike others, are mainly worried with keeping the power up and building fortifications. You are equipped with \
			a Mercenary Freelancer Engineer's gear."
	outfit = /obj/outfit/admin/generic/cryo_outpost_crew/mercenary/engineer

/singleton/role/cryo_outpost/director
	name = "Outpost Director"
	desc = "You are the director of this outpost. You were tasked with making profit using the stolen proprietary cloning tech. Things seem to have gone bad, however, \
			and it's up to you to figure out what to do next. One thing is clear - you hold a trove of information that any corporation or mercenary would be \
			thrilled to get out of you."
	outfit = /obj/outfit/admin/generic/cryo_outpost_crew/director

/singleton/role/cryo_outpost/scientist
	name = "Outpost Scientist"
	desc = "You are a scentist tasked with making profit using the stolen proprietary cloning tech. You are equipped with a Zeng-Hu scientist's gear."
	outfit = /obj/outfit/admin/generic/cryo_outpost_crew/scientist

/singleton/role/cryo_outpost/engineer
	name = "Outpost Engineer"
	desc = "You are an engineer in charge of keeping the outpost functioning. Luckily, your utility to someone else might be what saves your skin \
			this time around..."
	outfit = /obj/outfit/admin/generic/cryo_outpost_crew/engineer
