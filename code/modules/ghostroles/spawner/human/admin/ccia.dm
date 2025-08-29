/*
	Agents and their Escorts
*/

/datum/ghostspawner/human/admin/corporate
	short_name = null
	name = "Corporate Entity"
	desc = "A corporate entity so dull it doesn't even exist. Thrilling!"

	tags = list("CCIA")
	landmark_name = "CCIAAgent"
	req_perms = R_CCIAA

	possible_species = list(SPECIES_HUMAN, SPECIES_HUMAN_OFFWORLD, SPECIES_SKRELL, SPECIES_SKRELL_AXIORI)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	respawn_flag = null
	mob_name = null
