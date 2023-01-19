class_name ProjectileLaser
extends Projectile

var speed: = 1500.0

func _ready():
	pass

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision != null:
		on_collision(collision)
