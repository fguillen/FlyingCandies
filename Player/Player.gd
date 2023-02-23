class_name Player
extends Character

onready var ship_engine: = $ShipEngine

var pilot

func _ready():
	call_deferred("setup")


func setup():
	pilot = Global.pilot
	Global.set_player(self)
	ship_engine.setup(self)


func get_class():
	return "Player"