class_name Feedback
extends Node2D

export var reparent:bool

signal finished()

func _ready():
	if reparent:
		get_parent().call_deferred("remove_child", self)
		get_tree().current_scene.call_deferred("add_child", self)

func perform(_position:Vector2):
	emit_signal("finished")
