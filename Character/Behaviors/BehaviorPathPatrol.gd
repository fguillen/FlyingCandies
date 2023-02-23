class_name BehaviorPathPatrol
extends BehaviorRandomTimeShooter

var node_to_follow


func setup(character):
	.setup(character)
	node_to_follow = character.node_to_follow


func on_process(_delta):
	if(character.activated):
		character.input_manager.move_direction = (node_to_follow.global_position - character.global_position).normalized()
