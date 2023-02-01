class_name ProjectileMissile
extends ProjectileBase


export(NodePath) var objective_path = null
export(int) var direction_delta = 10
export(float) var speed_delta = 10.0
export(float) var speed_max = 40.0
export(float) var speed_ini = 1.0


onready var sensor := $Sensor


var objective:Node2D = null
var direction_ini = Vector2(1, 0)


func _ready():
	speed = speed_ini
	direction = direction_ini
	if(objective_path != null):
		objective = get_node(objective_path)


func _process(delta):
	if(objective != null):
		look_towards_objective(delta)
	else:
		find_closest_objective()

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


func find_closest_objective():
	var nodes = sensor.get_overlapping_bodies()

	if(nodes.size() != 0):
		objective = nodes[0]

		for node in nodes:
			if((global_position - node.global_position) < (global_position - objective.global_position)):
				objective = node
