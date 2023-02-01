class_name ProjectileMissile
extends ProjectileBase


export(NodePath) var objective_path
onready var objective: Node2D = get_node(objective_path)


export(int) var direction_delta = 10
export(float) var speed_delta = 10.0
export(float) var speed_max = 40.0
export(float) var speed_ini = 1.0


func _ready():
	speed = speed_ini


func _process(delta):
	look_towards_objective(delta)
	accelerate(delta)



func look_towards_objective(delta):
	var direction_to_objective = (objective.global_position - global_position).normalized()
	direction = direction.linear_interpolate(direction_to_objective, delta * direction_delta).normalized()
	global_rotation = direction.angle()


func accelerate(delta):
	if(speed >= speed_max):
		speed = speed_max
		return

	speed = move_toward(speed, speed_max, speed_delta * delta)
