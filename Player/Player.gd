class_name Player
extends Character

onready var ship_engine: = $ShipEngine

var pilot

func _ready():
	call_deferred("setup")
	connect("hit", self, "_on_hit")


func setup():
	pilot = Global.pilot
	Global.set_player(self)
	ship_engine.setup(self)


func get_class():
	return "Player"


func _on_hit(_position:Vector2) -> void:
	movement_manager.set_velocity(Vector2.ZERO)
