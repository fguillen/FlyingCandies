class_name ShipEngine
extends Node2D

const MIN_SCALE = 0.5
const MAX_SCALE = 1.5

var sprites: = []
var power = 0.0
var character


func setup(_character:Character):
	character = _character
	character.movement_manager.connect("velocity_changed", self, "on_velocity_changed")

	for child in get_children():
		if child is Sprite:
			sprites.append(child)


func on_velocity_changed(velocity:Vector2):
	set_power(velocity.length() / character.movement_manager.MAX_SPEED)


func set_power(value:float):
	if power == value: return

	power = value
	if power > 0:
		activate()
		scale(lerp(MIN_SCALE, MAX_SCALE, power))
	else:
		deactivate()


func activate():
	for sprite in sprites:
		sprite.set_visible(true)


func deactivate():
	for sprite in sprites:
		sprite.set_visible(false)


func scale(value:float):
	for sprite in sprites:
		sprite.set_scale(Vector2(value, value))
