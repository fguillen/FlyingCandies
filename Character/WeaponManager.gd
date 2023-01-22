class_name WeaponManager
extends Node2D

var weapons: = []
var actual_weapon:Weapon
var character

func _ready():
	pass

func setup(_character) -> void:
	character = _character

func add_weapon(weapon:Weapon) -> void:
	if weapon.get_parent() != null:
		weapon.get_parent().remove_child(weapon)

	add_child(weapon)
	weapon.setup(character, global_position)

	weapons.append(weapon)
	actual_weapon = weapon


func attack() -> void:
	if actual_weapon != null and actual_weapon.can_attack():
		actual_weapon.attack()

func can_attack() -> bool:
	return actual_weapon != null and actual_weapon.can_attack()
