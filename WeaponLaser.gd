class_name WeaponLaser
extends WeaponBase


func weapon_name() -> String:
	return "Laser"


func attack() -> ProjectileBase:
	print("WeaponLaser.attack: ", self.global_position)

	var projectile = .attack()
	projectile.node_origin = self

	return projectile
