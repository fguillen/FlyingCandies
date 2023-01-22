class_name InputManagerPlayer
extends InputManager

func _process(_delta):
	move_direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)

	attacking = Input.is_action_pressed("ui_accept")
