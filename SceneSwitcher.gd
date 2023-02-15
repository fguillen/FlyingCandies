extends CanvasLayer

func load_game_over():
	change_scene("res://GUI/GameOver.tscn")


func load_menu():
	change_scene("res://Menu/MenuScene.tscn")


func load_intro():
	change_scene("res://Intro/SergeantScene.tscn")


func load_game():
	change_scene("res://GameScene.tscn")


func change_scene(target: String) -> void:
	$AnimationPlayer.play("FadeIn")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("FadeIn")
