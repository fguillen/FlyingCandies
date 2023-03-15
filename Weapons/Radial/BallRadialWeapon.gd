class_name BallRadialWeapon
extends BaseWeapon

export(int) var num_projectiles := 10
export(int) var angle := 90


func weapon_name() -> String:
	return "BallRadial"


func attack(_delay:float = 0) -> Array:
	reloading = true
	reloading_timer.start(reload_time)

	var projectiles = []

	for i in num_projectiles:
		var projectile_angle = lerp(0, angle, float(i) / num_projectiles)
		projectile_angle -= (angle / 2.0)
		var projectile = projectile_template.instance()
		get_tree().current_scene.add_child(projectile)
		projectile.shoot(global_position, projectile_direction().rotated(deg2rad(projectile_angle)))

		projectiles.append(projectile)

	emit_signal("attack", global_position, projectile_direction())

	return projectiles
