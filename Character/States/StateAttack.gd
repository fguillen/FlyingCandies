class_name StateAttack
extends State


func enter(_msg := {}) -> void:
	character.animation_player.play("Attack")
	character.weapon_manager.attack()


func animation_ended():
	if character.movement_manager.direction == Vector2.ZERO:
		character.state_manager.transition_to("Idle")
	else:
		character.state_manager.transition_to("Move")


func physics_process(delta:float) -> void:
	character.movement_manager.direction = character.input_manager.get_move_direction()
	character.movement_manager.apply_friction(delta)
	character.movement_manager.apply_acceleration(delta)
