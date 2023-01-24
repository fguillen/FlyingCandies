class_name Player
extends Character

onready var ship_engine: = $ShipEngine

func _ready():
	Global.set_player(self)
	ship_engine.setup(self)
	connect("dead", self, "on_dead")
	Global.player_dead = false

func get_class():
	return "Player"

func on_dead(_positin) -> void:
	print("Player dead")
	Global.player_dead = true
	SceneSwitcher.load_game_over()
