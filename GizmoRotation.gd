tool

class_name GizmoRotation
extends Node2D

export var length := 40 setget set_length
export var width := 4 setget set_width
export var color := Color.whitesmoke setget set_color

var previous_rotation := 0.0
var parent_node:Node2D


func _ready():
	if get_parent() is Node2D:
		parent_node = get_parent()
	else:
		push_warning("GizmoRotation. Parent class no valid: %s" % get_parent().get_class())

	if parent_node:
		previous_rotation = parent_node.global_rotation


func _process(_delta):
	if parent_node and Engine.editor_hint:
		if previous_rotation != parent_node.global_rotation:
			update()


func _draw():
	if parent_node and Engine.editor_hint:
		draw_line(
			Vector2.ZERO,
			(Vector2.RIGHT * length),
			color,
			width
		)


func set_length(value):
	length = value
	update()


func set_width(value):
	width = value
	update()


func set_color(value):
	color = value
	update()
