class_name MovementManager
extends Node

export(float) var FRICTION_DELTA = 100.0
export(float) var ACCELERATION_DELTA = 100.0
export(float) var MAX_SPEED = 500.0

signal velocity_changed(value)

var velocity: = Vector2.ZERO setget set_velocity, get_velocity
var direction: = Vector2.ZERO


func apply_friction():
	if direction.length() != 0: return

	self.velocity = velocity.move_toward(Vector2.ZERO, FRICTION_DELTA)


func apply_acceleration():
	if direction.length() == 0: return

	self.velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION_DELTA)


func get_velocity():
	return velocity


func set_velocity(value:Vector2):
	print("Set velocity: ", value)
	if value != velocity:
		velocity = value
		emit_signal("velocity_changed", self.velocity)
