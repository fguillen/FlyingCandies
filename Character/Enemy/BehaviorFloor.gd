class_name BehaviorFloor
extends Behavior

export var shoot_time := Vector2(1, 5)


func on_process(_delta):
	character.input_manager.move_direction = Vector2.LEFT


func check_if_shoot():
	pass
