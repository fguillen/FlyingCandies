class_name WeaponBallDirection
extends WeaponBase

func projectile_direction() -> Vector2:
	var direction = (Global.player.global_position - global_position).normalized()
	print("projectile_direction: ", direction)
	return direction


func can_attack():
	return .can_attack() and !Global.player_dead
