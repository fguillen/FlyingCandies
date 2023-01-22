class_name Player
extends Character

onready var ship_engine: = $ShipEngine

const WeaponDefault = preload("res://WeaponBase.tscn")

func _ready():
	var weapon = WeaponDefault.instance()
	weapon_manager.add_weapon(weapon)

	ship_engine.setup(self)


func get_class():
	return "Player"
