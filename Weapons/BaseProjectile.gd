class_name BaseProjectile
extends KinematicBody2D

export(int) var damage = 1
export(float) var speed = 300.0

onready var collision_shape: = $CollisionShape2D

signal shoot(position)
signal hit(position)

var direction := Vector2.ZERO


func _ready():
	Global.add_projectile(self)

func shoot(position:Vector2, direction:Vector2):
	global_position = position
	self.direction = direction
	rotation = direction.angle()

	emit_signal("shoot", global_position)


func on_collision(collisionable, position:Vector2, free:bool = true):
	if collisionable.has_method("get_hit"):
		collisionable.get_hit(damage, position)
		emit_signal("hit", position)

	if(free):
		queue_free()


func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision != null:
		on_collision(collision.collider, collision.position)
