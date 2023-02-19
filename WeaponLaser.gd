class_name WeaponLaser
extends WeaponBase


func weapon_name() -> String:
	return "Laser"


func attack() -> Array:
	print("WeaponLaser.attack: ", self.global_position)

	var projectiles = .attack()
	projectiles[0].node_origin = self

	return projectiles
