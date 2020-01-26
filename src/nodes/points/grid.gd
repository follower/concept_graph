tool
extends ConceptNode

class_name ConceptNodeGridPoint

"""
Generates a list of points aligned to a grid in a 3D volume
"""


var _x: SpinBox
var _y: SpinBox
var _z: SpinBox


func _ready() -> void:
	# x, output
	set_slot(0,
		true, ConceptGraphDataType.NUMBER_SINGLE, ConceptGraphColor.NUMBER_SINGLE,
		true, ConceptGraphDataType.POINT_ARRAY, ConceptGraphColor.POINT_ARRAY)
	_x = _create_spin_box()

	# y
	set_slot(1,
		true, ConceptGraphDataType.NUMBER_SINGLE, ConceptGraphColor.NUMBER_SINGLE,
		false, 0, Color(0))
	_y = _create_spin_box()

	# z
	set_slot(2,
		true, ConceptGraphDataType.NUMBER_SINGLE, ConceptGraphColor.NUMBER_SINGLE,
		false, 0, Color(0))
	_z = _create_spin_box()


func get_name() -> String:
	return "Gridpoint"


func get_category() -> String:
	return "Points"


func get_description() -> String:
	return "Generates a list of points aligned to a grid in a 3D volume"


func _generate_output() -> Array:
	return []


func _create_spin_box() -> SpinBox:
	var box = SpinBox.new()
	box.allow_greater = true
	add_child(box)
	return box
