/datum/skill/athletics
	name = "Athletics"
	title = "Athlete"
	desc = "Twinkle twinkle little star, hit the gym and lift the bar."
	// The skill value modifier effects the max duration that is possible for /datum/status_effect/exercised; The rands modifier determines block probability and crit probability while boxing against boxers
	modifiers = list(
		SKILL_VALUE_MODIFIER = list(
			1 MINUTES,
			1.5 MINUTES,
			2 MINUTES,
			2.5 MINUTES,
			3 MINUTES,
			3.5 MINUTES,
			5 MINUTES
		),
		SKILL_RANDS_MODIFIER = list(
			0,
			5,
			10,
			15,
			20,
			30,
			50
		)
	)

	skill_item_path = /obj/item/clothing/gloves/boxing/golden

/datum/skill/athletics/New()
	. = ..()
	levelUpMessages[SKILL_LEVEL_NOVICE] = span_nicegreen("I am just getting started on my [name] journey! I think I should be able to identify other people who are working to improve their body by sight.")
	levelUpMessages[SKILL_LEVEL_APPRENTICE] = span_nicegreen("I have a routine, a rhythm. I feel like I am getting better at [name].")
	levelUpMessages[SKILL_LEVEL_JOURNEYMAN] = span_nicegreen("I reach a state of zen while exercising. When I exercise nothing else seems to matter. It is just me, my routine and my muscles.")
	levelUpMessages[SKILL_LEVEL_MASTER] = span_nicegreen("I feel like I've reached a plateau of my physical abilities. I am stronger than most but it is not enough. I must get stronger. Perhaps through other enhancements...")
	levelUpMessages[SKILL_LEVEL_LEGENDARY] = span_nicegreen("I have reach the zenith of my abilities. This is what peak performance looks like. I feel as I could suplex a moon.")

/datum/skill/athletics/level_gained(datum/mind/mind, new_level, old_level, silent)
	. = ..()
	if(new_level >= SKILL_LEVEL_NOVICE && old_level < SKILL_LEVEL_NOVICE)
		ADD_TRAIT(mind, TRAIT_EXAMINE_FITNESS, SKILL_TRAIT)

/datum/skill/athletics/level_lost(datum/mind/mind, new_level, old_level, silent)
	. = ..()
	if(old_level >= SKILL_LEVEL_NOVICE && new_level < SKILL_LEVEL_NOVICE)
		REMOVE_TRAIT(mind, TRAIT_EXAMINE_FITNESS, SKILL_TRAIT)

/datum/skill/athletics/level_gained(datum/mind/mind, new_level, old_level, silent)
	. = ..()
	if(new_level = SKILL_LEVEL_LEGENDARY) // Adds the ability to suplex rods to legendary athletics
		ADD_TRAIT(mind, TRAIT_ROD_SUPLEX)

	/datum/skill/athletics/level_lost(datum/mind/mind, new_level, old_level, silent)
	. = ..()
	if(new_level < SKILL_LEVEL_LEGENDARY && old_level = SKILL_LEVEL_LEGENDARY) // Removes the suplex ability if athletics drops below legendary
		REMOVE_TRAIT(mind, TRAIT_ROD_SUPLEX)
