class_name Trait extends Resource

enum TraitType {
	MAJOR,
	MINOR,
	ZOOMORPHIC,
	UNIQUE,
	MAJOR_SUBTRAIT,
	MINOR_SUBTRAIT,
	PSIONIC_POWER
}

@export var name: String
@export var source: String = "Now"
@export var type: TraitType
@export var cost: int
@export var is_universal: bool
@export var description: String
@export var requirements: Array[String]
@export var subtraits: Array[Trait]
## Any stat modifications related to this Trait.
@export var stat_modifications: Dictionary
