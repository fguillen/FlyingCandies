class_name WeaponBallTowardsPlayer
extends BaseWeapon


func weapon_name() -> String:
	return "BallTowardsPlayer"


func projectile_direction() -> Vector2:
	if not is_instance_valid(Global.player):
		return Vector2.LEFT

	var direction = (Global.player.global_position - global_position).normalized()
	return direction


func can_attack():
	return .can_attack() and !Global.player_dead
