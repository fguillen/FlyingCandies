class_name StateIdle
extends State


func enter(_msg := {}) -> void:
	character.animation_player.play("Idle")

func physics_process(delta: float) -> void:
	character.movement_manager.direction = character.input_manager.get_move_direction()

	if character.movement_manager.direction != Vector2.ZERO:
		character.state_manager.transition_to("Move")
		return

	if character.input_manager.is_attacking() and character.weapon_manager.can_attack():
		character.state_manager.transition_to("Attack")

	character.movement_manager.apply_friction(delta)
