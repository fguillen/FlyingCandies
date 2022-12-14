extends Node


onready var animation_player:= $AnimationPlayer

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		animation_player.play("Jump")
