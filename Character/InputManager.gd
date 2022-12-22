class_name InputManager
extends Node

var move_direction = Vector2.ZERO
var attacking = false


func get_move_direction() -> Vector2:
	return move_direction

func is_attacking() -> bool:
	return attacking
