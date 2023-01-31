class_name Enemy
extends Character

export var points: = 10
export var behavior_path := NodePath()

onready var behavior := get_node(behavior_path)

var activated = false

signal activate()

func _ready():
	connect("dead", self, "on_dead")
	setup()


func setup():
	behavior.setup((self as Character))
	looking_towards = Vector2.LEFT


func on_dead(_position):
	Global.add_points(points)


func get_class():
	return "Enemy"


func activate():
	on_activate()
	activated = true
	emit_signal("activate")


func on_activate():
	pass


func on_screen_exited():
	print("Enemy.on_screen_exited", global_position)
	queue_free()
