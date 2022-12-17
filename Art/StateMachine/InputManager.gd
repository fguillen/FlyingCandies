class_name InputManager
extends Node


func get_move_direction() -> Vector2:
	var result := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)

	return result
