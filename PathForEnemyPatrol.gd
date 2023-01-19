class_name PathForEnemyPatrol
extends Path2D

var speed

onready var path_follow: = $PathFollow2D

func _ready():
	call_deferred("setup")

func _process(delta):
	path_follow.offset += delta * speed

func setup():
	var current_scene = get_tree().current_scene
	var position = global_position
	get_parent().remove_child(self)
	current_scene.add_child(self)
	global_position = position
