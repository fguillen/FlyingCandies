extends Control



func _input(event):
	if event.is_action_pressed("ui_accept"):
		SceneSwitcher.load_intro()


func _on_Button_pressed():
	SceneSwitcher.load_intro()
