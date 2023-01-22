class_name BehaviorFloor
extends Behavior

export var shoot_time := Vector2(1, 5)

onready var timer := $Timer


func on_process(_delta):
	character.input_manager.move_direction = Vector2.LEFT


func shoot():
	character.input_manager.move_direction = Vector2.LEFT
