class_name Behavior
extends Node

var character

func setup(_character:Character):
	character = _character

func _process(_delta):
	character.input_manager.move_direction = Vector2.LEFT
	# pass
