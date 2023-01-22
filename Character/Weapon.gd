class_name Weapon
extends Node2D

export(float) var reload_time: = 1.0

export (Resource) var projectile_template = null
var reloading: = false
var reloading_timer: = Timer.new()
var character

signal attack(position)

func _ready():
	add_child(reloading_timer)
	reloading_timer.set_one_shot(true)
	var _i = reloading_timer.connect("timeout", self, "_on_reloading_timer_timeout")

func setup(_character, position:Vector2):
	character = _character
	global_position = position

func can_attack() -> bool:
	return not reloading

func attack() -> void:
	reloading = true
	reloading_timer.start(reload_time)

	var projectile = projectile_template.instance()
	get_tree().current_scene.add_child(projectile)
	projectile.shoot(global_position, character.looking_towards)

	emit_signal("attack", global_position)

func _on_reloading_timer_timeout():
	reloading = false
