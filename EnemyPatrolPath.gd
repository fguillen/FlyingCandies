class_name EnemyPatrolPath
extends Enemy

export var path_path := NodePath()
var path: Path2D

var node_to_follow

func setup():
	print("EnemyPatrolPath.path_path: ", path_path)
	path = get_node(path_path)
	node_to_follow = path.attach_enemy(self)
	print("node_to_follow: ", node_to_follow)

	ship_engine.setup(self)
	behavior.setup(self)
