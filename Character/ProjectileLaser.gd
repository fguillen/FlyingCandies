class_name ProjectileLaser
extends ProjectileBase

export(int) var length = 20
export(int) var hits_per_second = 3

onready var line:Line2D = $Line2D
onready var ray_cast:RayCast2D = $RayCast2D

var node_origin:Node2D = null


func _physics_process(_delta):
	if(node_origin == null): return

	var position_ini = node_origin.global_position
	var position_end = node_origin.global_position + (direction * length)

	# print("ProjectileLaser.positions[%s, %s]" % [position_ini, position_end])

	ray_cast.global_position = position_ini
	ray_cast.set_cast_to(position_end - position_ini)

	var collider = ray_cast.get_collider()

	if collider != null:
		position_end = collider.global_position

	line.global_position = position_ini
	line.points[0] = Vector2.ZERO
	line.points[1] = position_end - position_ini
