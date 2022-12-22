class_name Enemy
extends Character

onready var ship_engine: = $ShipEngine
onready var behaviour: = $Behavior

const WeaponDefault = preload("res://WeaponLaser.tscn")

func _ready():
	var weapon = WeaponDefault.instance()
	weapon_manager.add_weapon(weapon)

	ship_engine.setup(self)
	behaviour.setup(self)


func get_class():
	return "Enemy"
