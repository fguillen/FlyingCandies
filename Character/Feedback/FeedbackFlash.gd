class_name FeedbackFlash
extends Feedback

export var flashing_time = 0.2
export var sprite_to_flash_path := NodePath()

onready var timer: = $Timer
onready var sprite_to_flash: Sprite = get_node(sprite_to_flash_path)
onready var material_flash = preload("res://Character/Feedback/MaterialFlash.tres")

var flashing = false

func perform(_position:Vector2):
	if flashing:
		timer.start(flashing_time)
		return

	flashing = true
	var previous_material = sprite_to_flash.material
	sprite_to_flash.material = material_flash
	sprite_to_flash.material.set_shader_param("flash_modifier", 1)

	timer.start(flashing_time)
	yield(timer, "timeout")

	sprite_to_flash.material.set_shader_param("flash_modifier", 0)
	sprite_to_flash.material = previous_material

	flashing = false
