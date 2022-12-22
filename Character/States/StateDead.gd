class_name StateDead
extends State


func enter(_msg := {}) -> void:
	character.animation_player.play("Dead")


func animation_ended() -> void:
	character.queue_free()
