class_name MovementManager
extends Node

export(float) var FRICTION_DELTA = 100.0
export(float) var ACCELERATION_DELTA = 100.0
export(float) var MAX_SPEED = 500.0

var velocity: = Vector2.ZERO
var direction: = Vector2.ZERO


func apply_friction():
	if direction.length() != 0: return

	velocity = velocity.move_toward(Vector2.ZERO, FRICTION_DELTA)


func apply_acceleration():
	if direction.length() == 0: return

	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION_DELTA)
