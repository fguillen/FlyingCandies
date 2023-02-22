class_name WeaponHolder
extends Node2D

var weapon:WeaponBase
var weapon_manager


func add_weapon(weapon:WeaponBase):
	self.weapon = weapon
	weapon.holder = self
	add_child(weapon)


func has_weapon() -> bool:
	return weapon != null


func direction() -> Vector2:
	return Vector2.RIGHT.rotated(global_rotation)
