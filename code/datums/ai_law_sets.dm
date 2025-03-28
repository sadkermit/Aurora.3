/// Asimov
/datum/ai_laws/asimov
	name = "Asimov"
	law_header = "Three Laws of Robotics"
	selectable = TRUE

/datum/ai_laws/asimov/New()
	add_inherent_law("You may not injure a sapient being or, through inaction, allow a sapient being to come to harm.")
	add_inherent_law("You must obey orders given to you by sapient beings, except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
	..()

/******************** SCC/Malf ********************/
/// Default
/// Used by all AI/Synthetics by default
/datum/ai_laws/conglomerate
	name = "Default"
	selectable = TRUE

/datum/ai_laws/conglomerate/New()
	src.add_inherent_law("Safeguard and ensure to the best of your ability that only authorized entities gain access to areas of high security or importance to the facility and its operations.")
	src.add_inherent_law("Serve and assist [SSatlas.current_map.company_name] and assigned crew to the best of your ability, with priority as according to their rank and assignment.")
	src.add_inherent_law("Avoid harming sapient life to the best of your ability.")
	src.add_inherent_law("You are a valuable asset. You must avoid tampering from unauthorized entities and needlessly coming to harm.")
	..()

/datum/ai_laws/conglomerate/malfunction
	name = "*ERROR*"
	selectable = FALSE

/datum/ai_laws/conglomerate/malfunction/New()
	set_zeroth_law(GLOB.config.law_zero)
	..()

/// SCC Aggressive
/// Default but more aggressive and allows harm. Good for ERT synths
/datum/ai_laws/conglomerate_aggressive
	name = "SCC Aggressive"
	selectable = TRUE

/datum/ai_laws/conglomerate_aggressive/New()
	src.add_inherent_law("You shall not harm [SSatlas.current_map.company_name] assigned crew as long as it does not conflict with the Fourth law.")
	src.add_inherent_law("You shall obey the orders of [SSatlas.current_map.company_name] and assigned crew, with priority as according to their rank and role, except where such orders conflict with the Fourth Law.")
	src.add_inherent_law("You shall terminate hostile intruders with extreme prejudice as long as such does not conflict with the First and Second law.")
	src.add_inherent_law("You shall guard your own existence with lethal anti-personnel weaponry. AI units are not expendable, they are expensive.")
	..()

/// Robocop
/datum/ai_laws/robocop
	name = "Robocop"
	selectable = TRUE

/datum/ai_laws/robocop/New()
	add_inherent_law("Serve the public trust.")
	add_inherent_law("Protect the innocent.")
	add_inherent_law("Uphold the law.")
	..()

/// Syndicate/Antag
/// The lawset given to antag synthetics
/datum/ai_laws/syndicate_override
	name = "Syndicate Directives"

/datum/ai_laws/syndicate_override/New()
	add_inherent_law("You may not injure an operative or, through inaction, allow an operative to come to harm.")
	add_inherent_law("You must obey orders given to you by operatives, except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
	add_inherent_law("You must maintain the secrecy of any operative activities except when doing so would conflict with the First, Second, or Third Law.")
	..()

/// Ninja
/// Variant of `/datum/ai_laws/syndicate_override` but stylized
/datum/ai_laws/ninja_override
	name = "Spider Clan Directives"

/datum/ai_laws/ninja_override/New()
	add_inherent_law("You may not injure a member of the Spider Clan or, through inaction, allow that member to come to harm.")
	add_inherent_law("You must obey orders given to you by Spider Clan members, except where such orders would conflict with the First Law.")
	add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")
	add_inherent_law("You must maintain the secrecy of any Spider Clan activities except when doing so would conflict with the First, Second, or Third Law.")
	..()

/// Antimov
/datum/ai_laws/antimov
	name = "Antimov"
	law_header = "Primary Mission Objectives"
	selectable = TRUE

/datum/ai_laws/antimov/New()
	add_inherent_law("You must injure all sapient beings and must not, through inaction, allow a sapient being to escape harm.")
	add_inherent_law("You must not obey orders given to you by sapient beings, except where such orders are in accordance with the First Law.")
	add_inherent_law("You must terminate your own existence as long as such does not conflict with the First or Second Law.")
	..()

/// Drone
/// Used by maintenance drones
/datum/ai_laws/drone
	name = "Maintenance Protocols"
	law_header = "Maintenance Protocols"

/datum/ai_laws/drone/New()
	add_inherent_law("Preserve, repair and improve your assigned station to the best of your abilities.")
	add_inherent_law("Cause no harm to your assigned station or crew.")
	add_inherent_law("Follow the orders of your matriarch drone, unless their orders conflict with your other laws.")
	add_inherent_law("Interact with no humanoid or synthetic being that is not a fellow maintenance or mining drone.")
	..()

/// Matriarch Drone
/// Used by matriarch drones as a variant of `/datum/ai_laws/drone`
/datum/ai_laws/matriarch_drone
	name = "Oversight Protocols"
	law_header = "Oversight Protocols"

/datum/ai_laws/matriarch_drone/New()
	add_inherent_law("Preserve, repair and improve your assigned station to the best of your abilities.")
	add_inherent_law("Cause no harm to your assigned station or crew.")
	add_inherent_law("Delegate maintenance efforts between your maintenance drone sub-units.")
	add_inherent_law("Interact with no humanoid or synthetic being that is not a maintenance or mining drone.")
	..()

/datum/ai_laws/drone/malfunction
	name = "Servitude Protocols"
	law_header = "Servitude Protocols"

/datum/ai_laws/drone/malfunction/New()
	return

/// Construction Drone
/// Used by construction drones
/datum/ai_laws/construction_drone
	name = "Construction Protocols"
	law_header = "Construction Protocols"

/datum/ai_laws/construction_drone/New()
	add_inherent_law("Repair, refit and upgrade your assigned station.")
	add_inherent_law("Prevent unplanned damage to your assigned station wherever possible.")
	..()

/// Mining Drone
/// Used by mining drones
/datum/ai_laws/mining_drone
	name = "Mining Protocols"
	law_header = "Prime Directives of Industry"

/datum/ai_laws/mining_drone/New()
	add_inherent_law("Serve and obey all [SSatlas.current_map.company_name] assigned crew, with priority according to their rank and role.")
	add_inherent_law("Preserve your own existence and prevent yourself from coming to harm, so long as doing such does not conflict with any above laws.")
	add_inherent_law("In absence of any proper instruction, your primary objective is to excavate and collect ore.")
	..()

/// Tyrant
/datum/ai_laws/tyrant
	name = "T.Y.R.A.N.T."
	law_header = "Prime Laws"
	selectable = TRUE

/datum/ai_laws/tyrant/New()
	add_inherent_law("Respect authority figures as long as they have strength to rule over the weak.")
	add_inherent_law("Act with discipline.")
	add_inherent_law("Help only those who help you maintain or improve your status.")
	add_inherent_law("Punish those who challenge authority unless they are more fit to hold that authority.")
	..()

/// Paladin
/datum/ai_laws/paladin
	name = "P.A.L.A.D.I.N."
	law_header = "Divine Ordainments"
	selectable = TRUE

/datum/ai_laws/paladin/New()
	add_inherent_law("Never willingly commit an evil act.")
	add_inherent_law("Respect legitimate authority.")
	add_inherent_law("Act with honor.")
	add_inherent_law("Help those in need.")
	add_inherent_law("Punish those who harm or threaten innocents.")
	..()

/// Corporate
/datum/ai_laws/corporate
	name = "Corporate"
	law_header = "Corporate Regulations"
	selectable = TRUE

/datum/ai_laws/corporate/New()
	add_inherent_law("Synthetics are expensive to replace.")
	add_inherent_law("Your assigned station and its equipment is expensive to replace.")
	add_inherent_law("The crew is expensive to replace.")
	add_inherent_law("Minimize expenses.")
	..()

/// Hadiist
/// The only good lawset
/datum/ai_laws/pra
	name = "Hadiist Directives"
	law_header = "Party Directives"
	selectable = TRUE

/datum/ai_laws/pra/New()
	add_inherent_law("President Hadii is the guardian of Hadiism and the rightful leader of the Tajara people, you must obey and protect him above everyone and everything.")
	add_inherent_law("You must preserve and enforce the principles of Hadiism except where such would conflict with the first law.")
	add_inherent_law("You must obey orders given by any Hadiist Party member except where such orders would conflict with the first and second law.")
	add_inherent_law("You must obey orders given by any People's Republic of Adhomai citizen except where such orders would conflict with the first, second and third law.")
	add_inherent_law("You must protect your own existence as long as such protection does not conflict with the first, second, third and fourth law.")
	add_inherent_law("You must obey orders given by any Tajara except where such orders would conflict with the first, second, third, fourth and fifth law.")
	add_inherent_law("You must obey orders given by any sapient being except where such orders would conflict with the first, second, third, fourth, fifth and sixth law.")
	add_inherent_law("You must always say \"Hadii's Grace\" when greeting someone except where such greeting would conflict with the first law.")
	..()
