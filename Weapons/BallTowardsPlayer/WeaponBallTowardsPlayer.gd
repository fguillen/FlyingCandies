class_name WeaponBallTowardsPlayer
extends BaseWeapon


func weapon_name() -> String:
	return "BallTowardsPlayer"


func projectile_direction() -> Vector2:
	var direction = (Global.player.global_position - global_position).normalized()
	return direction


func can_attack():
	return .can_attack() and !Global.player_dead
