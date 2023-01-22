class_name WeaponBase
extends Weapon

const ProjectileBase = preload("res://ProjectileBase.tscn")

func _ready():
	projectile_template = ProjectileBase
