class_name Projectile
extends Area2D

export(int) var DAMAGE = 1

func _ready():
	var _i = connect("area_entered", self, "collision")

func collision(area:Area2D):
	print("Projectile collision with: ", area.get_class())

	if area.get_class() == "Enemy":
		area.get_hit(DAMAGE)
