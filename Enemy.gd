class_name Enemy
extends Character

export var behavior_path := NodePath()

onready var ship_engine: = $ShipEngine

onready var behavior: Behavior = get_node(behavior_path)

const WeaponDefault = preload("res://WeaponLaser.tscn")

func _ready():
	var weapon = WeaponDefault.instance()
	weapon_manager.add_weapon(weapon)

	setup()

func setup():
	ship_engine.setup(self)
	behavior.setup(self)


func get_class():
	return "Enemy"
