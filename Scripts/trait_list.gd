class_name TraitList extends Resource

@export var traits: Array[Trait]
@export var subtraits: Dictionary[Trait,bool]

func append(list_to_append: TraitList):
	traits.append_array(list_to_append.traits)
	subtraits.merge(list_to_append.subtraits)
