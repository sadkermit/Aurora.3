// Noise "language", for audible emotes.
/datum/language/noise
	name = LANGUAGE_NOISE
	desc = "Noises."
	key = ""
	flags = RESTRICTED | NONGLOBAL | INNATE | NO_TALK_MSG | NO_STUTTER | TCOMSSIM
	allow_accents = TRUE

/datum/language/noise/format_message(message, verb)
	return span("message", "<span class='[colour]'>[message]</span>")

/datum/language/noise/format_message_plain(message, verb)
	return message

/datum/language/noise/format_message_radio(message, verb, accent)
	return "<span class='[colour]'>[message]</span>"

/datum/language/noise/get_talkinto_msg_range(message)
	// if you make a loud noise (screams etc), you'll be heard from 4 tiles over instead of two
	return (copytext(message, length(message)) == "!") ? 4 : 2

// 'basic' language; spoken by default.
/datum/language/common
	name = LANGUAGE_TCB
	desc = "A spiritual successor of Esperanto, established in 2404 in Tau Ceti by Ceti intellectuals. Its unique, fully customized alphabet and structure allow it to be spoken even by most alien species. It's the official language of Tau Ceti and has growing traction in diplomatic circles and Universalists across human space."
	speech_verb = list("says")
	key = "0"
	flags = RESTRICTED|TCOMSSIM
	allow_accents = TRUE
	syllables = list("a", "ado", "ago", "aj", "ajn", "al", "alt", "am", "amas", "an", "ang", "ante", "ap", "ard", "arma", "aro", "as", "aur", "aut", "aw", "ba", "bal", "bao", "be", "beau", "bel", "bi", "bit", "blu", "bo", "bod", "boj", "bojn", "bu", "but", "ca", "caj", "ce", "cer", "chun",
	"ci", "cion", "coj", "cor", "da", "daj", "dan", "de", "den", "dis", "do", "dor", "dorm", "eco", "ego", "ek", "eks", "en", "ero", "es", "est", "et", "eve", "fa", "fe", "fel", "fla", "foj", "fra", "fraz", "fros", "ful", "fut", "ga", "gan", "gar", "gi", "gis", "go", "gran", "ha", "han", "hav",
	"hom", "hong", "hu", "hum", "hushi", "ia", "iaj", "ica", "id", "idon", "il", "in", "ing", "io", "is", "iton", "iza", "ja", "ji", "jirou", "joj", "ka", "kaj", "kajo", "kan", "ke", "ket", "ki", "kna", "krio", "ku", "kui", "kuk", "kun", "kur", "la", "laca", "leng", "les", "li", "liao", "lib",
	"ling", "lis", "lo", "lon", "long", "lu", "lud", "ma", "mal", "man", "me", "mego", "mero", "mi", "mia", "min", "mo", "moj", "mola", "mon", "mul", "ne", "ner", "ni", "nio", "no", "nu", "of", "oj", "om", "on", "ou", "pe", "pi", "plan", "pli", "po", "por", "post", "pre", "prin", "pru", "pu",
	"pur", "qiu", "que", "ra", "ras", "re", "ri", "rig", "ril", "ro", "roj", "ron", "roso", "rou", "ru", "sa", "san", "sci", "sek", "shi", "shiia", "shiue", "shiwu", "shu", "shui", "si", "siaj", "sku", "so", "som", "sti", "str", "stre", "su", "suno", "ta", "tan", "tas", "te", "tel", "tem",
	"the", "ti", "tian", "tita", "tiu", "to", "toj", "ton", "tran", "tre", "tri", "trin", "tro", "trus", "un", "undo", "uno ", "uz", "va", "var", "varm", "vas", "ve", "vek", "ven", "ves", "vi", "via", "vin", "vino", "vint", "vir", "von", "vu", "whe", "wu", "yong", "zem", "zo", "zoj", "zon")

// Sign language
/datum/language/sign
	name = LANGUAGE_SIGN
	desc = "A signed version of Tau Ceti Basic. It is primarily used by those who are deaf, hearing impaired, or mute."
	speech_verb = list("signs")
	signlang_verb = list("signs", "gestures")
	sing_verb = null
	colour = "i"
	key = "s"
	flags = NO_STUTTER | SIGNLANG

// Helper
/proc/get_lang_name(var/datum/language/language)
	if (!language || !istype(language))
		return "Unknown"

	return language.name

/datum/language/aphasia
	name = LANGUAGE_GIBBERING
	desc = "It is theorized that any sufficiently brain-damaged person can speak this language."
	speech_verb = list("garbles")
	ask_verb = list("mumbles")
	whisper_verb = list("mutters")
	exclaim_verb = list("screams incoherently")
	sing_verb = list("gibbers")
	key = "gi"
	syllables = list("m","n","gh","h","l","s","r","a","e","i","o","u")
	space_chance = 20
	flags = RESTRICTED
