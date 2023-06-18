#define REM 0.2 // Means 'Reagent Effect Multiplier'. This is how many units of reagent are consumed per tick

#define CHEM_TOUCH 1
#define CHEM_INGEST 2
#define CHEM_BLOOD 3
#define CHEM_BREATHE 4

#define WET_TYPE_WATER 1
#define WET_TYPE_LUBE 2
#define WET_TYPE_ICE 3

#define MINIMUM_CHEMICAL_VOLUME 0.01

#define SOLID 1
#define LIQUID 2
#define GAS 3

#define REAGENTS_PER_SHEET 20
#define MAX_PILL_SPRITE 20 //max icon state of the pill sprites

#define REAGENTS_OVERDOSE 20
#define REAGENTS_BURNING_TEMP_HIGH T0C + 65 //Temperature at which high temperature burns occur
#define REAGENTS_BURNING_TEMP_HIGH_DAMAGE 0.1 //Damage per celcius per unit above the REAGENTS_BURNING_TEMP_HIGH define per unit.
#define REAGENTS_BURNING_TEMP_HIGH_DAMAGE_CAP 40 //Maximum amount of burn damage to deal due to high temperature reagents.

#define REAGENTS_BURNING_TEMP_LOW T0C - 55 //Temperature at which low temperature burns occur
#define REAGENTS_BURNING_TEMP_LOW_DAMAGE 0.1 //Damage per celcius per unit below the REAGENTS_BURNING_TEMP_LOW define per unit.
#define REAGENTS_BURNING_TEMP_LOW_DAMAGE_CAP 40 //Maximum amount of burn damage to deal due to low temperature reagents.

#define REAGENTS_BODYTEMP 0.002 //Increase in body temperature per unit per celcius above current body temperature.
#define REAGENTS_BODYTEMP_MIN 0.25 //Minimum amount of increase to actually increase body temperature. The increase is also rounded to this value.
#define REAGENTS_BODYTEMP_MAX 10 //Maximum allowed increase in body temperature (K) per unit.

#define CHEM_SYNTH_ENERGY 500 // How much energy does it take to synthesize 1 unit of chemical, in Joules.

// Some on_mob_life() procs check for alien races.
#define IS_DIONA   1
#define IS_SKRELL  2
#define IS_UNATHI  4
#define IS_TAJARA  8
#define IS_XENOS   16
#define IS_MACHINE 32
#define IS_VAURCA  64
#define IS_UNDEAD  128

// Apply status effects
#define CE_ADRENALINE	"adrenal"		// Like speedboost but different
#define CE_ALCOHOL      "alcohol"		// Liver filtering
#define CE_ANTIEMETIC   "antiemetic"	// suppresses vomiting
#define CE_ITCH         "itch"          // causes itching
#define CE_NOITCH       "noitch"        // suppresses itching
#define CE_BERSERK      "berserk"
#define CE_CLUMSY       "clumsy"		// Peridaxon side effects, etc
#define CE_DROPITEM     "dropitem"		// keloderm side effect
#define CE_EMETIC       "emetic"		// thetamycin side effect, verunol
#define CE_FEVER        "fever"			// causes fever
#define CE_NOCOUGH      "nocough"		// suppresses coughing
#define CE_NOFEVER      "nofever"		// suppresses fever
#define CE_NOPULSE      "heartstop"		// Stops heartbeat
#define CE_SEDATE       "sedation"
#define CE_SLOWDOWN     "goslow"
#define CE_SPEEDBOOST   "gofast"		// Hyperzine
#define CE_STABLE       "stable"		// Epinephrine
#define CE_PACIFIED     "pacified"
#define CE_PAINKILLER   "painkiller"
#define CE_PULSE        "xcardic"		// increases or decreases heartrate
#define CE_UNDEXTROUS   "undextrous"    // arms no work right
#define CE_HALLUCINATE  "hallucinogen"	// Makes hallucinations stronger or weaker
#define CE_CRYO 	    "cryogenic"     // Prevents damage from being frozen
#define CE_CLEARSIGHT   "clearsight"    // prevents the blurry eye chem side effect
#define CE_STRAIGHTWALK "straightwalk"  // prevents the confused walking chem side effect
#define CE_NOSTUTTER    "nostutter"		// helps alleviate stuttering
#define CE_HAUNTED      "haunted"       // Spectrocybin's ghost vision

// Apply healing effects
#define CE_ANTIBIOTIC   "antibiotic"	// Thetamycin
#define CE_ANTITOXIN    "antitoxin"		// Dylovene and stuff
#define CE_BLOODRESTORE "bloodrestore"	// Iron/nutriment
#define CE_BRAIN_REGEN  "brainfix"		// Alkysine
#define CE_OXYGENATED   "oxygenated"	// Dexalin
#define CE_BLOODCLOT    "bloodclot"		// Coagzolug
#define CE_ORGANREPAIR  "organrepair"	// Rezadone
#define CE_ANTIPARASITE "antiparasite"  // Helmizole, garlic

// Deal damage
#define CE_BREATHLOSS   "breathloss"
#define CE_TOXIN        "toxins"		// General toxins
#define CE_NEUROTOXIC   "braintoxic"	// Brain damage
#define CE_NEPHROTOXIC  "kidneytoxic"	// Kidney damage
#define CE_HEPATOTOXIC  "livertoxic"	// Liver damage
#define CE_CARDIOTOXIC  "hearttoxic"	// Heart damage
#define CE_PNEUMOTOXIC  "lungtoxic"		// Lung damage

//Alcohol
#define INTOX_BUZZED     0.01
#define INTOX_JUDGEIMP   0.03
#define INTOX_MUSCLEIMP  0.08
#define INTOX_REACTION   0.10
#define INTOX_VOMIT		 0.12
#define INTOX_BALANCE    0.15
#define INTOX_BLACKOUT   0.20
#define INTOX_CONSCIOUS  0.30
#define INTOX_DEATH      0.45

//How many units of intoxication to remove per second
#define INTOX_FILTER_HEALTHY 0.10
#define INTOX_FILTER_BRUISED 0.07
#define INTOX_FILTER_DAMAGED 0.03

#define	BASE_DIZZY 50 //Base dizziness from getting drunk.
#define DIZZY_ADD_SCALE 15 //Amount added for every 0.01 percent over the JUDGEIMP limit

#define	BASE_VOMIT_CHANCE 10 //Base chance
#define	VOMIT_CHANCE_SCALE 2.5 //Percent change added for every 0.01 percent over the VOMIT limit

#define REAGENTS_FREE_SPACE(R) (R.maximum_volume - R.total_volume)
#define REAGENT_VOLUME(REAGENT_HOLDER, REAGENT_TYPE) (REAGENT_HOLDER?.reagent_volumes && REAGENT_HOLDER.reagent_volumes[REAGENT_TYPE])
#define REAGENT_DATA(REAGENT_HOLDER, REAGENT_TYPE)   (REAGENT_HOLDER?.reagent_data    && REAGENT_HOLDER.reagent_data[REAGENT_TYPE])

//Defines for randomchems
#define RC_STRONG_TASTE 2.0
#define RC_AVERAGE_TASTE 1.0
#define RC_WEAK_TASTE 0.2

#define RC_FAST_METABOLISM 0.8
#define RC_AVERAGE_METABOLISM 0.2
#define RC_SLOW_METABOLISM 0.04

#define RC_HIGH_OVERDOSE 30
#define RC_AVERAGE_OVERDOSE 20
#define RC_LOW_OVERDOSE 10

#define RC_WEAK_DISINFECTANT 1
#define RC_MILD_DISINFECTANT 5
#define RC_STRONG_DISINFECTANT 10

//Randomchem properties
#define RC_PROPERTY_EMETIC "randchem_emetic"
#define RC_PROPERTY_ANTIEMETIC "randchem_antiemetic"
#define RC_PROPERTY_ITCH "randchem_itch"
#define RC_PROPERTY_NOITCH "randchem_noitch"
#define RC_PROPERTY_FEVER "randchem_fever"
#define RC_PROPERTY_NOFEVER "randchem_nofever"
#define RC_PROPERTY_CLUMSY "randchem_clumsy"
#define RC_PROPERTY_DROPITEM "randchem_dropitem"
#define RC_PROPERTY_STABLE "randchem_pulsestable"
#define RC_PROPERTY_CLEARSIGHT "randchem_clearsight"
#define RC_PROPERTY_STRAIGHTWALK "randchem_straightwalk"
#define RC_PROPERTY_NOSUTTER "randchem_nostutter"
#define RC_PROPERTY_ANTIPARASITIC "randchem_antiparasitic"

#define RC_PROPERTY_PAINKILLER_WEAK "randchem_weakpainkiller"
#define RC_PROPERTY_PAINKILLER_MILD "randchem_mildpainkiller"
#define RC_PROPERTY_PAINKILLER_STRONG "randchem_strongpainkiller"

#define RC_PROPERTY_SPEEDBOOSTER_WEAK "randchem_weakspeedbooster"
#define RC_PROPERTY_SPEEDBOOSTER_MILD "randchem_mildspeedbooster"
#define RC_PROPERTY_SPEEDBOOSTER_STRONG "randchem_strongspeedbooster"

#define RC_PROPERTY_ANTIBIOTIC_WEAK "randchem_weakantibiotic"
#define RC_PROPERTY_ANTIBIOTIC_MILD "randchem_mildantibiotic"
#define RC_PROPERTY_ANTIBIOTIC_STRONG "randchem_strongantibiotic"

#define RC_PROPERTY_BLOODRESTORER_WEAK "randchem_weakbloodrestorer"
#define RC_PROPERTY_BLOODRESTORER_MILD "randchem_mildbloodrestorer"
#define RC_PROPERTY_BLOODRESTORER_STRONG "randchem_strongbloodrestorer"

#define RC_PROPERTY_BRAINREGENNER_WEAK "randchem_weakbrainregenner"
#define RC_PROPERTY_BRAINREGENNER_MILD "randchem_mildbrainregenner"
#define RC_PROPERTY_BRAINREGENNER_STRONG "randchem_strongbrainregenner"

#define RC_PROPERTY_NEPHROTOXIN_WEAK "randchem_weaknephrotoxin"
#define RC_PROPERTY_NEPHROTOXIN_MILD "randchem_mildnephrotoxin"
#define RC_PROPERTY_NEPHROTOXIN_STRONG "randchem_strongnephrotoxin"

#define RC_PROPERTY_HEPATOTOXIN_WEAK "randchem_weakhepatotoxin"
#define RC_PROPERTY_HEPATOTOXIN_MILD "randchem_mildhepatotoxin"
#define RC_PROPERTY_HEPATOTOXIN_STRONG "randchem_stronghepatotoxin"

#define RC_PROPERTY_NEUROTOXIN_WEAK "randchem_weakneurotoxin"
#define RC_PROPERTY_NEUROTOXIN_MILD "randchem_mildneurotoxin"
#define RC_PROPERTY_NEUROTOXIN_STRONG "randchem_strongneurotoxin"

#define RC_PROPERTY_CARDIOTOXIN_WEAK "randchem_weakcardiotoxin"
#define RC_PROPERTY_CARDIOTOXIN_MILD "randchem_mildcardiotoxin"
#define RC_PROPERTY_CARDIOTOXIN_STRONG "randchem_strongcardiotoxin"

#define RC_PROPERTY_PNEUMOTOXIN_WEAK "randchem_weakpneumotoxin"
#define RC_PROPERTY_PNEUMOTOXIN_MILD "randchem_mildpneumotoxin"
#define RC_PROPERTY_PNEUMOTOXIN_STRONG "randchem_strongpneumotoxin"

#define RC_PROPERTIES = list(RC_PROPERTY_EMETIC, RC_PROPERTY_ANTIEMETIC, RC_PROPERTY_ITCH, RC_PROPERTY_NOITCH, \
	RC_PROPERTY_FEVER, RC_PROPERTY_NOFEVER, RC_PROPERTY_CLUMSY, RC_PROPERTY_DROPITEM, RC_PROPERTY_STABLE, RC_PROPERTY_CLEARSIGHT, \
	RC_PROPERTY_STRAIGHTWALK, RC_PROPERTY_NOSTUTTER, RC_PROPERTY_PAINKILLER_WEAK, RC_PROPERTY_PAINKILLER_MILD, \
	RC_PROPERTY_PAINKILLER_STRONG, RC_PROPERTY_SPEEDBOOSTER_WEAK, RC_PROPERTY_SPEEDBOOSTER_MILD, RC_PROPERTY_SPEEDBOOSTER_STRONG, \
	RC_PROPERTY_ANTIBIOTIC_WEAK, RC_PROPERTY_ANTIBIOTIC_MILD, RC_PROPERTY_ANTIBIOTIC_STRONG, RC_PROPERTY_BLOODRESTORER_WEAK, \
	RC_PROPERTY_BLOODRESTORER_MILD, RC_PROPERTY_BLOODRESTORER_STRONG, RC_PROPERTY_BRAINREGENNER_WEAK, RC_PROPERTY_BRAINREGENNER_MILD, \
	RC_PROPERTY_BRAINREGENNER_STRONG, RC_PROPERTY_NEPHROTOXIN_WEAK, RC_PROPERTY_NEPHROTOXIN_MILD, RC_PROPERTY_NEPHROTOXIN_STRONG, \
	RC_PROPERTY_HEPATOTOXIN_WEAK, RC_PROPERTY_HEPATOTOXIN_MILD, RC_PROPERTY_HEPATOTOXIN_STRONG, RC_PROPERTY_NEUROTOXIN_WEAK, \
	RC_PROPERTY_NEUROTOXIN_MILD, RC_PROPERTY_NEUROTOXIN_STRONG, RC_PROPERTY_CARDIOTOXIN_WEAK, RC_PROPERTY_CARDIOTOXIN_MILD, \
	RC_PROPERTY_CARDIOTOXIN_STRONG, RC_PROPERTY_PNEUMOTOXIN_WEAK, RC_PROPERTY_PNEUMOTOXIN_MILD, RC_PROPERTY_PNEUMOTOXIN_STRONG)

#define RC_WEAK_PAINKILLER 30
#define RC_MILD_PAINKILLER 75
#define RC_STRONG_PAINKILLER 200

#define RC_WEAK_SPEEDBOOST 0.5
#define RC_MILD_SPEEDBOOST 1
#define RC_STRONG_SPEEDBOOST 1.5

#define RC_WEAK_ANTIBIOTIC 2
#define RC_MILD_ANTIBIOTIC 5
#define RC_STRONG_ANTIBIOTIC 15

#define RC_WEAK_BLOODRESTORE 3*removed
#define RC_MILD_BLOODRESTORE 6*removed
#define RC_STRONG_BLOODRESTORE 10*removed

#define RC_WEAK_BRAIN_REGEN 5
#define RC_MILD_BRAIN_REGEN 20
#define RC_STRONG_BRAIN_REGEN 40

#define RC_WEAK_ORGANTOXIN 1
#define RC_MILD_ORGANTOXIN 3
#define RC_STRONG_ORGANTOXIN 5
