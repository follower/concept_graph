tool
extends ConceptNode


func _init() -> void:
	unique_id = "conditional_bool"
	display_name = "Conditional Boolean"
	category = "Flow Control"
	description = "Simple boolean condition, returns one of the two inputs"

	set_input(0, "True", ConceptGraphDataType.ANY)
	set_input(1, "False", ConceptGraphDataType.ANY)
	set_input(2, "Condition", ConceptGraphDataType.BOOLEAN, {"value": true})
	set_output(0, "", ConceptGraphDataType.ANY)


func _generate_outputs() -> void:
	var condition: bool = get_input_single(2, true)

	if condition:
		output[0] = get_input(0)
	else:
		output[0] = get_input(1)


func _on_connection_changed():
	._on_connection_changed()
	cancel_type_mirroring(1, 0)
	cancel_type_mirroring(0, 0)

	if is_input_connected(0):
		mirror_slots_type(0, 0)
	elif is_input_connected(1):
		mirror_slots_type(1, 0)
