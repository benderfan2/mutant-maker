class_name Trait extends Resource

enum TraitType {
	MAJOR,
	MINOR,
	ZOOMORPHIC,
	UNIQUE,
	PSIONIC_POWER
}

@export var name: String
@export var type: TraitType
@export var cost: int
@export var is_universal: bool
@export var description: String
@export var requirements: Array
@export var subtraits: Array[Trait]
## Any stat modifications related to this Trait.
## Interpreted as a number unless it's negative, in which case it's interpreted as a specific stat as follows:
## -1: Cognition,
## -2: Determination,
## -3: Affinity,
## -4: Perception,
## -5: Strength,
## -6: Prowess,
## -7: Endurance,
## -8: Speed
@export var stat_modifications: Dictionary[String,int]
