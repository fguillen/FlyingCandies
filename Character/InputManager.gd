class_name InputManager
extends Node


func get_move_direction() -> Vector2:
	var result := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)

	result = result.limit_length(1.0)

	return result

func is_attacking() -> bool:
	return Input.is_action_pressed("ui_accept")
