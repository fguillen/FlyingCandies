extends CanvasLayer

onready var points_label:Label = $Control/Points


func _ready():
	points_label.text = str(Global.points)


func _input(event):
	if event.is_action_pressed("ui_accept"):
		SceneSwitcher.load_intro()


func _on_ButtonRestart_pressed():
	SceneSwitcher.load_intro()
