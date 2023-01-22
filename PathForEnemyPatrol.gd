class_name PathForEnemyPatrol
extends Path2D

const PathFollow2DWithSprite = preload("res://PathFollow2DWithSprite.tscn")

var followers = []

func _process(delta):
	for follower in followers:
		if follower["enemy"].activated:
			follower["path_follow"].offset += delta * follower["speed"]


func attach_enemy(enemy) -> Node2D:
	var path_follow = PathFollow2DWithSprite.instance()
	print("X1")
	call_deferred("add_child", path_follow)
	print("X2")

	var follower = {
		"enemy": enemy,
		"path_follow": path_follow,
		"speed": enemy.movement_manager.MAX_SPEED
	}

	followers.append(follower)

	return path_follow


func remove_enemy(enemy):
	print("remove_enemy")
	var element = null
	for follower in followers:
		print("follower.enemy: ", follower["enemy"], " ,", enemy)
		if follower["enemy"] == enemy:
			print("Is a match!")
			element = follower
			print("element: ", element)
			break

	print("element2: ", element)
	element["path_follow"].queue_free()
	followers.erase(element)
