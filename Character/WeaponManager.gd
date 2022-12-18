class_name WeaponManager
extends Node2D

var weapons: = []
var actual_weapon:Weapon

func _ready():
	pass


func add_weapon(weapon:Weapon) -> void:
	if weapon.get_parent() != null:
		weapon.get_parent().remove_child(weapon)

	add_child(weapon)
	weapon.global_position = global_position

	weapons.append(weapon)
	actual_weapon = weapon


func attack() -> void:
	print("WeaponManager.can_attack(): ", actual_weapon.can_attack())

	if actual_weapon != null and actual_weapon.can_attack():
		actual_weapon.attack()
