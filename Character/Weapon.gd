class_name Weapon
extends Node2D

export(float) var reload_time: = 1.0

export (Resource) var projectile_template = null
var reloading: = false
var reloading_timer: = Timer.new()
var character
var holder

signal attack(position)


func weapon_name() -> String:
	return "Weapon"


func setup(character):
	add_child(reloading_timer)
	reloading_timer.set_one_shot(true)
	var _i = reloading_timer.connect("timeout", self, "_on_reloading_timer_timeout")

	self.character = character


func can_attack() -> bool:
	return not reloading


func attack() -> Array:
	reloading = true
	reloading_timer.start(reload_time)

	var projectile = projectile_template.instance()
	get_tree().current_scene.add_child(projectile)
	projectile.shoot(global_position, projectile_direction())

	emit_signal("attack", global_position)

	return [projectile]


func projectile_direction() -> Vector2:
	return holder.direction()


func _on_reloading_timer_timeout():
	reloading = false
