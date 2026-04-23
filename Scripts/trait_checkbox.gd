class_name TraitCheckbox extends VBoxContainer

@export var main_trait: Trait
@export var required_subtraits: Array[Trait]
@export var optional_subtraits: Array[Trait]
var subtraits_selected: Array[Trait]
var total_cost: int

signal trait_pressed(toggled_on:bool,selected_trait:Trait,_subtraits:Array[Trait])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_traits()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_traits() -> void:
	if main_trait != null:
		total_cost = main_trait.cost
		
		%Trait.text = main_trait.name
		
		subtraits_selected = required_subtraits
		
		if !required_subtraits.is_empty():
			%Trait.text += ": "
			for subtrait in required_subtraits:
				%Trait.text += subtrait.name + " "
				total_cost += subtrait.cost
		else:
			%Trait.text += " "
		
		if main_trait.type != Trait.TraitType.MINOR:
			total_cost = max(total_cost,2)
			%Trait.text += "(" + str(total_cost) + " GOO-P)"
		
		for subtrait in main_trait.subtraits:
			if (subtrait in optional_subtraits or subtrait.is_universal) and !(subtrait in required_subtraits):
				var subtrait_checkbox := CheckBox.new()
				
				subtrait_checkbox.name = subtrait.name
				subtrait_checkbox.text = subtrait.name
				if subtrait.type != Trait.TraitType.MINOR and subtrait.type != Trait.TraitType.MINOR_SUBTRAIT:
					subtrait_checkbox.text += " (" + str(subtrait.cost) + " GOO-P)"
				var subtrait_toggle_lambda = func(toggled_on:bool):
					trait_pressed.emit(toggled_on,subtrait,[] as Array[Trait])
				subtrait_checkbox.toggled.connect(subtrait_toggle_lambda)
				subtrait_checkbox.disabled = true
				%SubtraitContainer.add_child(subtrait_checkbox)


func _on_trait_toggled(toggled_on: bool) -> void:
	var subtrait_checkboxes = %SubtraitContainer.get_children()
	subtraits_selected = required_subtraits
	
	for checkbox in subtrait_checkboxes:
		checkbox.disabled = !toggled_on
		for subtrait in main_trait.subtraits:
			if (subtrait in optional_subtraits or subtrait.is_universal) and checkbox.name == subtrait.name and checkbox.button_pressed:
				subtraits_selected.append(subtrait)
	
	trait_pressed.emit(toggled_on,main_trait,subtraits_selected)
