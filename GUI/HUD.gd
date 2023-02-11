extends Control

onready var label_points:Label = $"%LabelPoints"
onready var shields_display := $"%ShieldsDisplay"
onready var pilot_ui := $"%PilotUI"


func _ready():
	Global.connect("points_changed", self, "on_points_changed")
	Global.connect("shields_changed", self, "on_shields_changed")
	Global.connect("shields_full_changed", self, "on_shields_full_changed")
	Global.connect("player_set", self, "on_player_set")


func on_points_changed(value):
	label_points.set_points(value)


func on_shields_changed(value):
	shields_display.set_num_shields(value)


func on_shields_full_changed(value):
	shields_display.set_num_shields_full(value)


func on_player_set(player: Player) -> void:
	print("HUD.on_player_set()")
	pilot_ui.setup(player.pilot)
