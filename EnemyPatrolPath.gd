class_name EnemyPatrolPath
extends Enemy

export var path_follow_path := NodePath()
var path_follow: PathFollow2D

func setup():
	path_follow = get_node(path_follow_path)
	print("path_follow: ", path_follow_path, ", ", path_follow)
	ship_engine.setup(self)
	behavior.setup(self)
