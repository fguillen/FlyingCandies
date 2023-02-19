class_name WeaponHolder
extends Node2D

var weapon:Weapon
var weapon_manager


func add_weapon(weapon:Weapon):
	self.weapon = weapon
	weapon.holder = self
	add_child(weapon)


func has_weapon() -> bool:
	return weapon != null


func direction() -> Vector2:
	return (weapon_manager.character.looking_towards.rotated(rotation)).normalized()
