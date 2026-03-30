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


func determine_source_of_mutation() -> MutationSources:
	var die_roll = randi_range(1,100)
	
	if die_roll in range(1,41):
		return MutationSources.CITY
	elif die_roll in range(41,71):
		return MutationSources.RURAL
	else:
		return MutationSources.INSTITUTION


func determine_background() -> String:
	var die_roll = randi_range(1,100)
	var background_decided = false
	var result = ""
	
	while !background_decided:
		match %BackgroundTable.selected:
			MutationSources.CITY:
				if die_roll in range(1,11):
					result += "[b]SELF-TAUGHT SURVIVOR:[/b] You scraped by alone. While you’ve had contact with humans, you had no guardian and survived via instincts and hard lessons. Gain: one basic or wild skill package, an additional wild skill package, four hobbies, a survivor equipment package (scavenger or urban), +2 Determination, +2 Will, +10 SHT, and +A on initiative rolls."
					background_decided = true
				elif die_roll in range(11,31):
					result += "[b]FRINGES OF SOCIETY:[/b] A street community adopted you: a homeless community, undocumented immigrants, runaways, etc. In turn, you assist them. Gain: one basic skill package, one street skill package, one wild skill package, four hobbies, a survivor equipment package (scavenger or urban), +2 to Perception, +1 CTCT, and +5 SHT."
					background_decided = true
				elif die_roll in range(31,41):
					result += "[b]RAISED BY A HUMAN:[/b] A human or human family adopted and raised you in secret. This is a relatively healthy home; if you want a more troubled past, check with your group first. Gain: two basic skill packages, one professional skill package, five hobbies, one basic equipment package, +2 to Cognition, and +1 CTCT."
					background_decided = true
				elif die_roll in range(41,51):
					result += "[b]RAISED BY A MUTANT:[/b] An experienced mutant mentored you. Roll for the mutant’s source and background, then gain the same packages and bonuses.[br][br]"
					die_roll = randi_range(1,100)
				elif die_roll in range(51,66):
					result += "[b]RAISED BY A MUTANT COMMUNITY:[/b] A clandestine group of mutant animals found and raised you. In return, you keep their secrets. Gain: one basic skill package, one street skill package, one wild skill package, four hobbies, one survivor or basic equipment package, +2 Speed, +1 WILL, and Value: Community."
					background_decided = true
				elif die_roll in range(66,81):
					result += "[b]ADOPTED BY AN INSTITUTION:[/b] A large institution caught you early in life, and you grew up there.[br][br]"
					die_roll = randi_range(1,100)
					%BackgroundTable.select(MutationSources.INSTITUTION)
				elif die_roll in range(81,86):
					result += "[b]FLED TO THE WILD:[/b] You escaped the city early in life, growing up in the wild.[br][br]"
					die_roll = randi_range(1,100)
					%BackgroundTable.select(MutationSources.RURAL)
				else:
					result += "[b]SWALLOWED BY THE SHADOWS:[/b] A covert group (criminal or espionage) raised you as an agent. Gain: two covert skill packages, one basic skill package, one hobby, one agent equipment package, +2 Prowess, +2 Speed, and +A on dramatic rolls to avoid notice. Your fighting style may be a secret fighting style."
					background_decided = true
			MutationSources.RURAL:
				if die_roll in range(1,21):
					result += "[b]LARGELY FERAL:[/b] You have avoided meaningful contact with humanity and have yet to be encultured. Gain: two wild skill packages, five hobbies, a survivor equipment package (scavenger or wild), +2 Strength, +2 Endurance, +2 Speed, and +A to any dramatic roll to find food, shelter, or avoid danger in the wild. The character starts without language. To understand and speak a language, they must spend a hobby to do so, and an additional hobby to write."
					background_decided = true
				elif die_roll in range(21,41):
					result += "[b]SELF-TAUGHT SURVIVOR:[/b] You scraped by alone. While you’ve had contact with humans, you had no guardian and survived via instincts and hard lessons. Gain: one basic or wild skill package, an additional wild skill package, four hobbies, a survivor equipment package (scavenger or wild), +2 Determination, +2 Will, +10 SHT, and +A on initiative rolls."
					background_decided = true
				elif die_roll in range(41,51):
					result += "[b]BACK-TO-THE-LANDER:[/b] A person or community separated from wider society adopted you. This may be a self-isolating enclave, a counterculture group, an indigenous community, etc. Gain: two basic skill packages, one military or professional skill package, five hobbies, a basic or survivor equipment package, +1 CTCT, +1 WILL, and Value: Community."
					background_decided = true
				elif die_roll in range(51,56):
					result += "[b]RAISED BY A HUMAN:[/b] A human or human family adopted and raised you in secret. This is a relatively healthy home; if you want a more troubled past, check with your group first. Gain: two basic skill packages, one wild skill package, five hobbies, one basic equipment package, +2 to Cognition, and +1 CTCT."
					background_decided = true
				elif die_roll in range(56,61):
					result += "[b]RAISED BY A MUTANT:[/b] An experienced mutant mentored you. Roll for the mutant’s source and background, then gain the same packages and bonuses.[br][br]"
					die_roll = randi_range(1,100)
				elif die_roll in range(61,81):
					result += "[b]FARM LIVING:[/b] A small farm family or community raised you. Gain: two basic skill packages, one professional skill package, four hobbies, one basic equipment package, +2 STR, +2 END."
					background_decided = true
				elif die_roll in range(81,97):
					result += "[b]URBAN IMMIGRANT:[/b] Though you mutated in the wild, you migrated to “civilization”.[br][br]"
					die_roll = randi_range(1,100)
					%BackgroundTable.select(MutationSources.CITY)
				else:
					result += "[b]ADOPTED BY AN ORGANIZATION:[/b] Though you mutated in the wild, an institution claimed you early in life.[br][br]"
					die_roll = randi_range(1,100)
					%BackgroundTable.select(MutationSources.INSTITUTION)
			MutationSources.INSTITUTION:
				if die_roll in range(1,11):
					result += "[b]RURAL ESCAPE:[/b] The organization released you, or you escaped soon after your mutation.[br][br]"
					die_roll = randi_range(1,100)
					%BackgroundTable.select(MutationSources.RURAL)
				elif die_roll in range(11,16):
					result += "[b]URBAN ESCAPE:[/b] The organization released you, or you escaped soon after your mutation.[br][br]"
					die_roll = randi_range(1,100)
					%BackgroundTable.select(MutationSources.CITY)
				elif die_roll in range(16,31):
					result += "[b]LAB SUBJECT, SOLITARY:[/b] A lab raised you as an experiment, but you escaped, or the organization released you. There has not been immediate pursuit. Gain: two basic skill packages, one professional or science skill package, one hobby, one escapee equipment package, +2 Cognition, +2 Perception, and +A to dramatic rolls to escape from confinement."
					background_decided = true
				elif die_roll in range(31,36):
					result += "[b]RAISED BY A MUTANT:[/b] An older mutant raised you while in captivity. Roll for the mutant’s source and background, then gain the same packages and bonuses, replacing any equipment with an escapee equipment package.[br][br]"
					die_roll = randi_range(1,100)
				elif die_roll in range(36,46):
					result += "[b]RAISED BY A HUMAN:[/b] The institution had a member raise you like one of their own. This is a relatively healthy home; if you want a more troubled past, check with your group first. Gain: two basic skill packages, one wild skill package, five hobbies, one basic equipment package, +2 to Cognition, and +1 CTCT."
					background_decided = true
				elif die_roll in range(46,61):
					result += "[b]ASSISTED ESCAPEE:[/b] A member of the institution fled with you, raising you on the run. "
					var x = randi_range(1,100)
					if x in range(1,31):
						result += "You’ve successfully gone underground. "
					else:
						result += "you’re still hunted by the institution, possibly with the help of law enforcement or government organizations. "
					result += "Gain: one basic skill package, one covert skill package, one science skill package, three hobbies, one basic equipment package, +2 Perception, +1 CTCT, and +1 WILL."
					background_decided = true
				elif die_roll in range(61,71):
					result += "[b]PUBLIC MASCOT:[/b] The institution raised you as a public relations symbol. Your feelings depend on your experience, but it has likely been a difficult existence due to high expectations and a restricted life. Gain: one basic skill package, a basic or professional skill package, six hobbies, one basic equipment package, and +4 Affinity."
					background_decided = true
				elif die_roll in range(71,96):
					result += "[b]AGENT/EMPLOYEE:[/b] The institution raised you to aid them with your unique genetic abilities. While broadly treated as an employee, the institution won’t allow you to easily leave their service. Gain: one basic skill package, two covert, military, or professional skill packages, two hobbies, one basic or agent equipment package, +10 SHT, +2 Prowess, and +1 WILL. Your fighting style may be a secret fighting style."
					background_decided = true
				else:
					result += "[b]SPONSORED FREEDOM:[/b] The organization raised you publicly as an adopted ward with monetary support. Their reasons could be charitable, scientific, or self-serving. Gain: three skill packages from the following categories: basic, professional, or science, four hobbies, a basic equipment package, and +3 Cognition."
	
	return result


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


func _on_roll_background_button_pressed() -> void:
	%BackgroundTableResultDescriptionLabel.text = determine_background()
	%BackgroundTableRerollButton.disabled = false
	%BackgroundTableSwapButton.disabled = false
	%BackgroundTableLockButton.disabled = false
