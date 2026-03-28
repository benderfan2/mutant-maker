class_name AttributePicker extends PopupPanel

signal choice_confirmed(attribute: String)

var attributes_to_disable: Array[bool] = [false,false,false,false,false,false,false,false]
var message_string := ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_about_to_popup() -> void:
	for attribute in range(len(attributes_to_disable)):
		%AttributeChoiceButton.set_item_disabled(attribute,attributes_to_disable[attribute])
	
	%MessageLabel.text = message_string


func _on_confirm_button_pressed() -> void:
	var attribute_chosen = %AttributeChoiceButton.selected
	
	match attribute_chosen:
		0: choice_confirmed.emit("Cognition")
		1: choice_confirmed.emit("Determination")
		2: choice_confirmed.emit("Affinity")
		3: choice_confirmed.emit("Perception")
		4: choice_confirmed.emit("Strength")
		5: choice_confirmed.emit("Prowess")
		6: choice_confirmed.emit("Endurance")
		7: choice_confirmed.emit("Speed")
	
	hide()
