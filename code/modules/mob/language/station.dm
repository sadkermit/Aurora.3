/datum/language/machine
	name = LANGUAGE_EAL
	short = "EAL"
	desc = "A language of encoded tones that allow for IPCs to communicate auditorily between each other in a manner that allows for easier transfer of information."
	speech_verb = list("beeps")
	ask_verb = list("beeps")
	exclaim_verb = list("loudly beeps")
	sing_verb = list("rhythmically beeps")
	colour = "changeling"
	written_style = "encodedaudiolanguage"
	key = "6"
	flags = RESTRICTED | NO_STUTTER | TCOMSSIM
	syllables = list("beep","beep","beep","beep","beep","boop","boop","boop","bop","bop","dee","dee","doo","doo","hiss","hss","buzz","buzz","bzz","ksssh","keey","wurr","wahh","tzzz")
	period_chance = 0
	space_chance = 0

/datum/language/machine/get_random_name()
	if(prob(70))
		return "[pick(list("PBU","HIU","SINA","ARMA","OSI"))]-[rand(100, 999)]"
	return pick(GLOB.ai_names)

// we're trimming out the punctuation and not readding it, so we need to readd it at the very end
/datum/language/machine/scramble(var/input, var/list/known_languages)
	. = ..()
	return formalize_text(.)

/datum/language/machine/process_word_prescramble(var/original_word, var/new_word, var/word_index, var/new_sentence, var/understand_chance, var/list/music_notes)
	// we drop every second word to make the resulting message shorter, to represent the effective compression of EAL
	if(word_index % 2)
		if(!prob(understand_chance) && !(original_word in music_notes))
			new_word = trim(scramble_word(original_word))
	else
		new_word = ""
	return list(new_word, new_sentence)

// we don't care about the input_size at all, we just want one syllable used
/datum/language/machine/scrambled_word_size_requirement(var/input_size)
	return 1
