class_name PathForEnemyPatrol
extends Path2D

var followers = []

func _process(delta):
	for follower in followers:
		follower["path_follow"].offset += delta * follower["speed"]


func attach_enemy(enemy:Enemy) -> Node2D:
	var path_follow = PathFollow2D.new()
	add_child(path_follow)

	var follower = {
		"path_follow": path_follow,
		"speed": enemy.movement_manager.MAX_SPEED
	}

	followers.append(follower)

	return path_follow
