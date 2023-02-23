class_name Utils
extends Node

static func get_parent_of_type(origin:Node, type:String) -> Node:
	var parent = origin.get_parent()

	if parent == null:
		push_warning("looking for parent type [%s], not found" % type)
		return null

	if parent.get_class() == type:
		return parent
	else:
		return get_parent_of_type(parent, type)
