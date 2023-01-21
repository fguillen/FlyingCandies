class_name BehaviorPathPatrol
extends Behavior

var node_to_follow

func setup(character:Character):
	.setup(character)
	node_to_follow = character.node_to_follow

func on_process(_delta):
	character.input_manager.move_direction = (node_to_follow.global_position - character.global_position).normalized()
