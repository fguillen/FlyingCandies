class_name Player
extends Character

onready var ship_engine: = $ShipEngine

func _ready():
	call_deferred("setup")


func setup():
	Global.set_player(self)
	ship_engine.setup(self)


func get_class():
	return "Player"
