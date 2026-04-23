class_name Species extends Resource

@export var name: String
@export var description: String
@export var base_goop: int
@export var size_rating: int
@export var enhancable_attributes: Array[String]
@export var source: String = "Now"
@export_group("Traits")
## Lists the Major traits available to this species.
@export var major_traits: Dictionary[String,TraitList] = {"Mutants in the Now":null,"Mutants in the Next":null}
## Lists the Minor traits available to this species.
@export var minor_traits: Dictionary[String,TraitList] = {"Mutants in the Now":null,"Mutants in the Next":null}
@export var unique_trait: Trait
@export var basic_traits: Array
