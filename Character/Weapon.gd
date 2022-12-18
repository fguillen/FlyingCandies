class_name Weapon
extends Node2D

export(float) var reload_time: = 1.0

var projectile_template
var reloading: = false
var reloading_timer: = Timer.new()

func _ready():
	add_child(reloading_timer)
	reloading_timer.set_one_shot(true)
	var _i = reloading_timer.connect("timeout", self, "_on_reloading_timer_timeout")

func can_attack() -> bool:
	return not reloading

func attack() -> void:
	reloading = true
	reloading_timer.start(reload_time)

	var projectile = projectile_template.instance()
	get_tree().current_scene.add_child(projectile)
	projectile.global_position = global_position

func _on_reloading_timer_timeout():
	reloading = false
