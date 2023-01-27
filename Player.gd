class_name Player
extends Character

onready var ship_engine: = $ShipEngine

func _ready():
	Global.set_player(self)
	ship_engine.setup(self)
	connect("dead", self, "on_dead")
	connect("health_changed", self, "on_health_changed")
	Global.player_dead = false


func get_class():
	return "Player"


func on_dead(_position) -> void:
	print("Player dead")
	Global.player_dead = true
	SceneSwitcher.load_game_over()


func on_health_changed(value) -> void:
	print("Player health changed")
	Global.set_shields_full(value)
