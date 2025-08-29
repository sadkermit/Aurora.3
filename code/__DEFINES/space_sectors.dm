//Comments contain criteria for whatever these sectors literally define, for future-proofing and consistency

/// Generic sectors are generic intermediate areas for when we can't attribute locale to anywhere in specific
#define SECTOR_GENERIC				"Generic Sector"
#define ALL_GENERIC_SECTORS		list(SECTOR_GENERIC)

/// For remote/uncharted regions distant from the civilised Spur. Some surveyors/independents only.
#define ALL_UNCHARTED_SECTORS list()

// For highly dangerous sectors with high piracy. Civilian and leisure ships should be less common or not found here.
#define ALL_DANGEROUS_SECTORS	list(ALL_UNCHARTED_SECTORS)

/// all non-generic, named and specific sectors, where generic planets or the like should not spawn
#define ALL_SPECIFIC_SECTORS	list()

/// Everything!
#define ALL_POSSIBLE_SECTORS list(ALL_GENERIC_SECTORS)

/// Sectors that block canon odysseys for reasons. Usually an ongoing remote/exclusive event arc area that shouldn't have canon odysseys muddling up (EG. the Horizon finds itself isolated and on its own). Very narrow use case. Not to be applied liberally.
#define ALL_EVENT_ONLY_SECTORS list()
