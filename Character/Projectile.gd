class_name Projectile
extends KinematicBody2D

export(int) var DAMAGE = 1

onready var collision_shape: = $CollisionShape2D

signal hit(position)


func on_collision(collision:KinematicCollision2D):
	print("Projectile collision with: ", collision.collider.get_class())

	if true: # collision.collider.get_class() == "Enemy":
		collision.collider.get_hit(DAMAGE)
		emit_signal("hit", collision.position)

	queue_free()
