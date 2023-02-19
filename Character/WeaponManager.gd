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
	weapon.setup(character)

	weapons.append(weapon)
	actual_weapon = weapon


func attack() -> void:
	for weapon in weapons:
		if weapon.can_attack():
			weapon.attack()


func can_attack() -> bool:
	for weapon in weapons:
		if weapon.can_attack():
			return true

	return false
