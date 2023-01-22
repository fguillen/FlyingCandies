class_name StateDead
extends State


func enter(_msg := {}) -> void:
	character.animation_player.play("Dead")
	character.movement_manager.velocity = Vector2.ZERO


func animation_ended() -> void:
	print("animation_ended")
	character.dead()
