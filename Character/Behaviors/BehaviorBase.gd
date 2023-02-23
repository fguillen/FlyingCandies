class_name BehaviorBase
extends Node

var character


func setup(_character:Character):
	character = _character


func _process(delta):
	on_process(delta)


func on_process(_delta):
	character.input_manager.move_direction = Vector2.LEFT
