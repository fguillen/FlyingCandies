class_name Projectile
extends Area2D

export(int) var DAMAGE = 1

onready var collision_shape: = $CollisionShape2D

signal hit(position)


func _ready():
	var _i = connect("area_entered", self, "on_collision")


func on_collision(area:Area2D):
	print("Projectile collision with: ", area.get_class())

	if area.get_class() == "Enemy":
		area.get_hit(DAMAGE)
		emit_signal("hit", collision_position(area))

	queue_free()


func collision_position(_area:Area2D) -> Vector2:
	return global_position
