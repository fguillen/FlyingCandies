class_name StateMove
extends State


func enter(_msg := {}) -> void:
	character.velocity = Vector2.ZERO

func physics_process(_delta: float) -> void:
	var direction = character.input_manager.get_move_direction()

	if direction == Vector2.ZERO:
		character.state_machine.transition_to("Idle")
		return

	character.velocity = direction * character.speed
	character.velocity = character.move_and_slide(character.velocity)
