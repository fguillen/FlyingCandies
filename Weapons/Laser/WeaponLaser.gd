class_name WeaponLaser
extends BaseWeapon

onready var timer_charging:Timer = $TimerCharging
onready var fee:Timer = $TimerCharging

export var charging_time := 1.0

signal charging(position)


func weapon_name() -> String:
	return "Laser"


func attack(delay:float = 0) -> Array:
	reloading = true

	if delay > 0:
		yield(get_tree().create_timer(delay), "timeout")

	reloading_timer.start(reload_time)

	_charging()

	return []


func _charging():
	emit_signal("charging", projectile_origin.global_position)
	timer_charging.start(charging_time)
	yield(timer_charging, "timeout")
	_shoot_laser()


func _shoot_laser():
	var projectile = projectile_template.instance()
	get_tree().current_scene.add_child(projectile)

	projectile.shoot(projectile_origin.global_position, projectile_direction())
	emit_signal("attack", projectile_origin.global_position, projectile_direction())

	projectile.node_origin = self
