class_name BehaviorPathPatrol
extends Behavior

var path_follow

func setup(character:Character):
	.setup(character)
	path_follow = character.path_follow
	path_follow.get_parent().speed = character.movement_manager.MAX_SPEED

func on_process(_delta):
	character.input_manager.move_direction = (path_follow.global_position - character.global_position).normalized()
	print("BehaviorPathPatrol: ", character.input_manager.move_direction)
