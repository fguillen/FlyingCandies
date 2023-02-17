class_name ProjectileLaser
extends ProjectileBase

export(int) var length_max = 200
export(float) var length_speed = 800.0
export(float) var length_actual = 0.0
export(int) var hits_per_second = 3
export(float) var life_seconds = 2.0

onready var line:Line2D = $Line2D
onready var ray_cast:RayCast2D = $RayCast2D
onready var life_timer:Timer = $LifeTimer
onready var hits_per_second_timer:Timer = $HitsPerSecondTimer


var node_origin:Node2D = null
var offset := 0.0
var life_expired = false
var hit_active = true

func shoot(position:Vector2, direction:Vector2):
	.shoot(position, direction)
	life_expired = false
	life_timer.start(life_seconds)


func _physics_process(delta):
	if(node_origin == null): return

	length_actual = move_toward(length_actual, length_max - offset, length_speed * delta)

	var position_ini = node_origin.global_position + (offset * direction)
	var position_end = position_ini + (direction * length_actual)

	if life_expired:
		offset = move_toward(offset, length_actual, length_speed * delta)

		if offset >= length_actual:
			_on_end_of_life()
			return

		position_ini += offset * direction

	# print("ProjectileLaser.positions[%s, %s]" % [position_ini, position_end])

	ray_cast.global_position = position_ini
	ray_cast.set_cast_to(position_end - position_ini)

	var collider = ray_cast.get_collider()

	if collider != null:
		var collision_position:Vector2 = ray_cast.get_collision_point()
		position_end = collision_position
		length_actual = (position_end - position_ini).length()
		if(hit_active):
			on_collision(collider, collision_position, false)

	line.global_position = position_ini
	line.points[0] = Vector2.ZERO
	line.points[1] = position_end - position_ini


func move_toward(actual:float, to:float, delta:float):
	if(actual < to):
		actual += delta
		actual = min(actual, to)

	return actual


func _on_HitsPerSecondTimer_timeout():
	print("ProjectileLaser._on_HitsPerSecondTimer_timeout()")
	hit_active = true


func _on_LifeTimer_timeout():
	life_expired = true

func _on_end_of_life():
	queue_free()


func on_collision(collisionable, position:Vector2, free:bool = true):
	print("ProjectileLaser.on_collision")
	.on_collision(collisionable, position, free)
	hit_active = false
	hits_per_second_timer.start(1.0 / hits_per_second)
