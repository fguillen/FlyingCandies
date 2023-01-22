class_name Enemy
extends Character

export var points: = 10
export var behavior_path := NodePath()

onready var behavior: Behavior = get_node(behavior_path)

var activated = false

const WeaponDefault = preload("res://WeaponBase.tscn")

func _ready():
	var weapon = WeaponDefault.instance()
	weapon_manager.add_weapon(weapon)

	var _i = connect("dead", self, "on_dead")

	setup()

func setup():
	behavior.setup(self)


func on_dead(_position):
	Global.add_points(points)

func get_class():
	return "Enemy"

func activate():
	print("Activate")
	on_activate()
	activated = true

func on_activate():
	pass
