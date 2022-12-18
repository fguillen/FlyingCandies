class_name ProjectileLaser
extends Projectile

var direction: = Vector2.RIGHT
var speed: = 1500.0

func _ready():
	pass

func _process(delta):
	global_position = global_position + (direction * speed * delta)
