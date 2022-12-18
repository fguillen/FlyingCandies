class_name WeaponLaser
extends Weapon

const ProjectileLaser = preload("res://ProjectileLaser.tscn")

func _ready():
	projectile_template = ProjectileLaser
