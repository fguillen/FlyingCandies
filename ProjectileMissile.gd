class_name ProjectileMissile
extends ProjectileBase


export(NodePath) var objective_path
onready var objective: Node2D = get_node(objective_path)


export(int) var direction_delta = 10
export(int) var speed_delta = 10
export(int) var speed_max = 40
export(int) var speed_ini = 1


func _ready():
	speed = speed_ini


func _process(delta):
	move_towards_objective(delta)


func move_towards_objective(delta):
	var direction_to_objective = (objective.global_position - global_position).normalized()
	direction = direction.linear_interpolate(direction_to_objective, delta * direction_delta).normalized()
	global_rotation = direction.angle()
