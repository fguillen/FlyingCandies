class_name ShipEngine
extends Node2D

export(Array) var sprites: = []

const MIN_SCALE = 0.5
const MAX_SCALE = 1.5


var power = 0.0
var character

func _ready():
	for child in get_children():
		if child is Sprite:
			sprites.append(child)

func setup(_character:Character):
	self.character = _character

func _process(_delta):
	set_power(character.movement_manager.velocity.length() / character.movement_manager.MAX_SPEED)

func set_power(value:float):
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
