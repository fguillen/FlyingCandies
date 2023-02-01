class_name ProjectileBase
extends KinematicBody2D

export(int) var damage = 1
export(float) var speed = 300.0

onready var collision_shape: = $CollisionShape2D

signal shoot(position)
signal hit(position)

var direction := Vector2.ZERO

func shoot(position:Vector2, _direction:Vector2):
	global_position = position
	direction = _direction

	emit_signal("shoot", global_position)

func on_collision(collision:KinematicCollision2D):
	print("Projectile collision with: ", collision.collider.get_class())

	if true: # collision.collider.get_class() == "Enemy":
		collision.collider.get_hit(damage, collision.position)
		emit_signal("hit", collision.position)

	queue_free()


func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision != null:
		on_collision(collision)
