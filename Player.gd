class_name Player
extends Character

onready var ship_engine: = $ShipEngine

func _ready():
	ship_engine.setup(self)

func get_class():
	return "Player"
