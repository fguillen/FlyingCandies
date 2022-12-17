class_name StateIdle
extends State


func enter(_msg := {}) -> void:
	character.velocity = Vector2.ZERO

func process(_delta: float) -> void:
	if character.input_manager.get_move_direction() != Vector2.ZERO:
		character.state_machine.transition_to("Move")
