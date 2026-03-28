extends PanelContainer

enum MutationSources {
	CITY,
	RURAL,
	INSTITUTION
}

const ATTRIBUTES_TABLE: Dictionary[int,Array] = {
	1:[-4,10,2,-2,19],
	2:[-4,15,2,-2,18],
	3:[-4,20,2,-2,17],
	4:[-3,24,2,-1,16],
	5:[-3,28,2,-1,15],
	6:[-2,32,2,0,14],
	7:[-2,36,2,0,13],
	8:[-1,40,2,1,12],
	9:[-1,43,3,1,11],
	10:[0,46,3,1,10],
	11:[0,49,3,1,9],
	12:[1,52,3,2,8],
	13:[1,55,3,2,7],
	14:[2,58,3,3,6],
	15:[2,60,4,3,5],
	16:[3,62,4,4,4],
	17:[3,64,4,4,3],
	18:[4,66,4,5,2],
	19:[4,68,4,5,1],
	20:[4,70,4,5,0],
	21:[5,71,5,6,-2],
	22:[5,72,5,6,-4],
	23:[5,73,5,6,-6],
	24:[6,74,5,7,-8],
	25:[6,75,6,7,-10],
	26:[6,76,6,7,-12],
	27:[7,77,6,8,-14],
	28:[7,78,7,8,-16],
	29:[7,79,7,8,-18],
	30:[8,80,8,9,-20]
}

const DAMAGE_DICE: Dictionary[int,String] = {
	-2:"-2R",
	-1:"-1R",
	0:"0",
	1:"1d6",
	2:"1d8",
	3:"1d10",
	4:"1d12",
	5:"2d8",
	6:"2d10",
	7:"2d12",
	8:"3d10",
	9:"3d12"
}

var base_takebacks := 0
var takebacks_modifier := 0
var takebacks_used := 0
var base_group_takebacks := 0
var group_takebacks_modifier := 0
var group_takebacks_used := 0
var cognition := 0
var determination := 0
var affinity := 0
var perception := 0
var strength := 0
var prowess := 0
var endurance := 0
var speed := 0
var source_of_mutation: MutationSources
var hp := 0
var sht := 0
var will := 0
var size_rating := 0
var lift := 0
var move := 0
var traits: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ((base_takebacks + takebacks_modifier) - takebacks_used) <= 0:
		if %Step3.visible == true:
			%CognitionRerollButton.disabled = true
			%DeterminationRerollButton.disabled = true
			%AffinityRerollButton.disabled = true
			%PerceptionRerollButton.disabled = true
			%StrengthRerollButton.disabled = true
			%ProwessRerollButton.disabled = true
			%EnduranceRerollButton.disabled = true
			%SpeedRerollButton.disabled = true
		if %Step4.visible == true:
			%SourceOfMutationRerollButton.disabled = true
			%SourceOfMutationSwapButton.disabled = true


func update_takebacks() -> void:
	%TakebacksLabel.text = "Takebacks: " + str((base_takebacks + takebacks_modifier) - takebacks_used)
	%GroupTakebacksLabel.text = "Group Takebacks: " + str((base_group_takebacks + group_takebacks_modifier) - group_takebacks_used)


func roll_attribute() -> int:
	return randi_range(1,6)+randi_range(1,6)+randi_range(1,6)+randi_range(1,6)


func update_cognition() -> void:
	%CognitionRoll.text = str(cognition)
	
	if ATTRIBUTES_TABLE[cognition][0] >= 0:
		%COGValueLabel.text = "+"
	else:
		%COGValueLabel.text = ""
	%COGValueLabel.text += str(ATTRIBUTES_TABLE[cognition][0])
	
	%CognitionSkillBaseLabel.text = str(ATTRIBUTES_TABLE[cognition][1]) + "%"
	
	%CognitionSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[cognition][2]) + "%"
	
	%CognitionDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[cognition][3]]
	
	%CognitionGOOPBonusLabel.text = str(ATTRIBUTES_TABLE[cognition][4])


func update_determination() -> void:
	%DeterminationRoll.text = str(determination)
	
	if ATTRIBUTES_TABLE[determination][0] >= 0:
		%DETValueLabel.text = "+"
	else:
		%DETValueLabel.text = ""
	%DETValueLabel.text += str(ATTRIBUTES_TABLE[determination][0])
	
	%DeterminationSkillBaseLabel.text = str(ATTRIBUTES_TABLE[determination][1]) + "%"
	
	%DeterminationSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[determination][2]) + "%"
	
	%DeterminationDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[determination][3]]
	
	%DeterminationGOOPBonusLabel.text = str(ATTRIBUTES_TABLE[determination][4])


func update_affinity() -> void:
	%AffinityRoll.text = str(affinity)
	
	if ATTRIBUTES_TABLE[affinity][0] >= 0:
		%AFFValueLabel.text = "+"
	else:
		%AFFValueLabel.text = ""
	%AFFValueLabel.text += str(ATTRIBUTES_TABLE[affinity][0])
	
	%AffinitySkillBaseLabel.text = str(ATTRIBUTES_TABLE[affinity][1]) + "%"
	
	%AffinitySkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[affinity][2]) + "%"
	
	%AffinityDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[affinity][3]]
	
	%AffinityGOOPBonusLabel.text = str(ATTRIBUTES_TABLE[affinity][4])


func update_perception() -> void:
	%PerceptionRoll.text = str(perception)
	
	if ATTRIBUTES_TABLE[perception][0] >= 0:
		%PERValueLabel.text = "+"
	else:
		%PERValueLabel.text = ""
	%PERValueLabel.text += str(ATTRIBUTES_TABLE[perception][0])
	
	%PerceptionSkillBaseLabel.text = str(ATTRIBUTES_TABLE[perception][1]) + "%"
	
	%PerceptionSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[perception][2]) + "%"
	
	%PerceptionDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[perception][3]]
	
	%PerceptionGOOPBonusLabel.text = str(ATTRIBUTES_TABLE[perception][4])


func update_strength() -> void:
	%StrengthRoll.text = str(strength)
	
	if ATTRIBUTES_TABLE[strength][0] >= 0:
		%STRValueLabel.text = "+"
	else:
		%STRValueLabel.text = ""
	%STRValueLabel.text += str(ATTRIBUTES_TABLE[strength][0])
	
	%StrengthSkillBaseLabel.text = str(ATTRIBUTES_TABLE[strength][1]) + "%"
	
	%StrengthSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[strength][2]) + "%"
	
	%StrengthDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[strength][3]]
	
	%StrengthGOOPBonusLabel.text = str(ATTRIBUTES_TABLE[strength][4])


func update_prowess() -> void:
	%ProwessRoll.text = str(prowess)
	
	if ATTRIBUTES_TABLE[prowess][0] >= 0:
		%PROValueLabel.text = "+"
	else:
		%PROValueLabel.text = ""
	%PROValueLabel.text += str(ATTRIBUTES_TABLE[prowess][0])
	
	%ProwessSkillBaseLabel.text = str(ATTRIBUTES_TABLE[prowess][1]) + "%"
	
	%ProwessSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[prowess][2]) + "%"
	
	%ProwessDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[prowess][3]]
	
	if ATTRIBUTES_TABLE[prowess][4] >= 0:
		%ProwessGOOPBonusLabel.text = "+"
	else:
		%ProwessGOOPBonusLabel.text = ""
	%ProwessGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[prowess][4])


func update_endurance() -> void:
	%EnduranceRoll.text = str(endurance)
	
	if ATTRIBUTES_TABLE[endurance][0] >= 0:
		%ENDValueLabel.text = "+"
	else:
		%ENDValueLabel.text = ""
	%ENDValueLabel.text += str(ATTRIBUTES_TABLE[endurance][0])
	
	%EnduranceSkillBaseLabel.text = str(ATTRIBUTES_TABLE[endurance][1]) + "%"
	
	%EnduranceSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[endurance][2]) + "%"
	
	%EnduranceDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[endurance][3]]
	
	if ATTRIBUTES_TABLE[endurance][4] >= 0:
		%EnduranceGOOPBonusLabel.text = "+"
	else:
		%EnduranceGOOPBonusLabel.text = ""
	%EnduranceGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[endurance][4])


func update_speed() -> void:
	%SpeedRoll.text = str(speed)
	
	if ATTRIBUTES_TABLE[speed][0] >= 0:
		%SPDValueLabel.text = "+"
	else:
		%SPDValueLabel.text = ""
	%SPDValueLabel.text += str(ATTRIBUTES_TABLE[speed][0])
	
	%SpeedSkillBaseLabel.text = str(ATTRIBUTES_TABLE[speed][1]) + "%"
	
	%SpeedSkillGainLabel.text = "+" + str(ATTRIBUTES_TABLE[speed][2]) + "%"
	
	%SpeedDamageDiceLabel.text = DAMAGE_DICE[ATTRIBUTES_TABLE[speed][3]]
	
	if ATTRIBUTES_TABLE[speed][4] >= 0:
		%SpeedGOOPBonusLabel.text = "+"
	else:
		%SpeedGOOPBonusLabel.text = ""
	%SpeedGOOPBonusLabel.text += str(ATTRIBUTES_TABLE[speed][4])


func update_stats() -> void:
	update_cognition()
	update_determination()
	update_affinity()
	update_perception()
	update_strength()
	update_prowess()
	update_endurance()
	update_speed()


func _on_group_type_item_selected(index: int) -> void:
	match index:
		0:
			base_takebacks = 4
			base_group_takebacks = 0
		1,2:
			base_takebacks = 3
			base_group_takebacks = 3
	
	%Step2.visible = true
	%Step3.visible = true
	
	update_takebacks()


func _on_roll_attributes_button_pressed() -> void:
	cognition = roll_attribute()
	%CognitionRerollButton.disabled = false
	
	determination = roll_attribute()
	%DeterminationRerollButton.disabled = false
	
	affinity = roll_attribute()
	%AffinityRerollButton.disabled = false
	
	perception = roll_attribute()
	%PerceptionRerollButton.disabled = false
	
	strength = roll_attribute()
	%StrengthRerollButton.disabled = false
	
	prowess = roll_attribute()
	%ProwessRerollButton.disabled = false
	
	endurance = roll_attribute()
	%EnduranceRerollButton.disabled = false
	
	speed = roll_attribute()
	%SpeedRerollButton.disabled = false
	
	update_stats()
	
	%RollAttributesButton.visible = false
	%LockAttributesButton.visible = true


func _on_cognition_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		cognition = roll_attribute()
	else:
		%CognitionMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		cognition += die_roll
		%AttributePicker.attributes_to_disable[0] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_cognition()
	update_takebacks()


func _on_determination_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		determination = roll_attribute()
	else:
		var die_roll = randi_range(1,6)
		%DeterminationMarkedButton.button_pressed = true
		determination += die_roll
		%AttributePicker.attributes_to_disable[1] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected attribute by " + str(die_roll) + " and increase Determination by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_determination()
	update_takebacks()


func _on_affinity_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		affinity = roll_attribute()
	else:
		var die_roll = randi_range(1,6)
		%AffinityMarkedButton.button_pressed = true
		affinity += die_roll
		%AttributePicker.attributes_to_disable[2] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_affinity()
	update_takebacks()


func _on_perception_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		perception = roll_attribute()
	else:
		%CognitionMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		perception += die_roll
		%AttributePicker.attributes_to_disable[3] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_perception()
	update_takebacks()


func _on_strength_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		strength = roll_attribute()
	else:
		%StrengthMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		strength += die_roll
		%AttributePicker.attributes_to_disable[4] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_strength()
	update_takebacks()


func _on_prowess_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		cognition = roll_attribute()
	else:
		%ProwessMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		prowess += die_roll
		%AttributePicker.attributes_to_disable[0] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_prowess()
	update_takebacks()


func _on_endurance_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		endurance = roll_attribute()
	else:
		%EnduranceMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		endurance += die_roll
		%AttributePicker.attributes_to_disable[0] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
			"Speed":
				speed = speed - die_roll
				update_speed()
	
	takebacks_used += 1
	
	update_endurance()
	update_takebacks()


func _on_speed_reroll_button_pressed() -> void:
	if %LockAttributesButton.visible == true:
		speed = roll_attribute()
	else:
		%SpeedMarkedButton.button_pressed = true
		var die_roll = randi_range(1,6)
		speed += die_roll
		%AttributePicker.attributes_to_disable[0] = true
		%AttributePicker.message_string = "Pick an attribute to reduce.\n\nThis will reduce the selected stat by " + str(die_roll) + " and increase Cognition by the same amount."
		%AttributePicker.popup_centered()
		var chosen_attribute = await %AttributePicker.choice_confirmed
		match chosen_attribute:
			"Determination":
				determination = determination - die_roll
				update_determination()
			"Affinity":
				affinity = affinity - die_roll
				update_affinity()
			"Perception":
				perception = perception - die_roll
				update_perception()
			"Strength":
				strength = strength - die_roll
				update_strength()
			"Prowess":
				prowess = prowess - die_roll
				update_prowess()
			"Endurance":
				endurance = endurance - die_roll
				update_endurance()
			"Cognition":
				cognition = cognition - die_roll
				update_cognition()
	
	takebacks_used += 1
	
	update_speed()
	update_takebacks()


func _on_lock_attributes_button_pressed() -> void:
	%CognitionRerollButton.text = "Add d6"
	%DeterminationRerollButton.text = "Add d6"
	%AffinityRerollButton.text = "Add d6"
	%PerceptionRerollButton.text = "Add d6"
	%StrengthRerollButton.text = "Add d6"
	%ProwessRerollButton.text = "Add d6"
	%EnduranceRerollButton.text = "Add d6"
	%SpeedRerollButton.text = "Add d6"
	
	%Step4.visible = true
	%LockAttributesButton.visible = false


func _on_roll_source_of_mutation_button_pressed() -> void:
	var die_roll = randi_range(1,100)
	
	%SourceOfMutationRoll.text = str(die_roll)
	
	if die_roll in range(1,41):
		source_of_mutation = MutationSources.CITY
		%SourceOfMutationDescriptionLabel.text = "[b]CHEMICAL LEAK:[/b] Goop leaked from an industrial site, commercial laboratory, or personal lab, either by negligence or sabotage."
	elif die_roll in range(41,71):
		source_of_mutation = MutationSources.RURAL
		%SourceOfMutationDescriptionLabel.text = "[b]TRANSPORTATION ACCIDENT:[/b] Goop spilled due to a crash, theft, or mishap."
	else:
		source_of_mutation = MutationSources.INSTITUTION
		%SourceOfMutationDescriptionLabel.text = "[b]EXPERIMENTATION RESULT:[/b] There was a deliberate experiment on an animal using Goop."
	
	%SourceOfMutationLockButton.disabled = false
	%SourceOfMutationRerollButton.disabled = false
	%SourceOfMutationSwapButton.disabled = false
	%RollSourceOfMutationButton.visible = false


func _on_source_of_mutation_reroll_button_pressed() -> void:
	var die_roll = randi_range(1,100)
	
	%SourceOfMutationRoll.text = str(die_roll)
	
	if die_roll in range(1,41):
		source_of_mutation = MutationSources.CITY
		%SourceOfMutationDescriptionLabel.text = "[b]CHEMICAL LEAK:[/b] Goop leaked from an industrial site, commercial laboratory, or personal lab, either by negligence or sabotage."
	elif die_roll in range(41,71):
		source_of_mutation = MutationSources.RURAL
		%SourceOfMutationDescriptionLabel.text = "[b]TRANSPORTATION ACCIDENT:[/b] Goop spilled due to a crash, theft, or mishap."
	else:
		source_of_mutation = MutationSources.INSTITUTION
		%SourceOfMutationDescriptionLabel.text = "[b]EXPERIMENTATION RESULT:[/b] There was a deliberate experiment on an animal using Goop."
		
	takebacks_used += 1
	update_takebacks()


func _on_source_of_mutation_swap_button_pressed() -> void:
	var new_result = (10 * %SourceOfMutationRoll.text.to_int() - 1) % 99 + 1
	
	%SourceOfMutationRoll.text = str(new_result)
	
	if new_result in range(1,41):
		source_of_mutation = MutationSources.CITY
		%SourceOfMutationDescriptionLabel.text = "[b]CHEMICAL LEAK:[/b] Goop leaked from an industrial site, commercial laboratory, or personal lab, either by negligence or sabotage."
	elif new_result in range(41,71):
		source_of_mutation = MutationSources.RURAL
		%SourceOfMutationDescriptionLabel.text = "[b]TRANSPORTATION ACCIDENT:[/b] Goop spilled due to a crash, theft, or mishap."
	else:
		source_of_mutation = MutationSources.INSTITUTION
		%SourceOfMutationDescriptionLabel.text = "[b]EXPERIMENTATION RESULT:[/b] There was a deliberate experiment on an animal using Goop."
	
	takebacks_used += 1
	update_takebacks()


func _on_source_of_mutation_lock_button_pressed() -> void:
	%SourceOfMutationRerollButton.disabled = true
	%SourceOfMutationSwapButton.disabled = true
	%SourceOfMutationLockButton.disabled = true
	
	%BackgroundTable.select(source_of_mutation)
	
	%BackgroundContainer.visible = true
