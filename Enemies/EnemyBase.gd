class_name EnemyBase
extends Character

export var points: = 10
export var behavior_path := NodePath()
export var activated := false

onready var behavior := get_node(behavior_path)

signal activate()

func _ready():
	connect("dead", self, "on_dead")
	setup()

	if(activated):
		activate()


func setup():
	behavior.setup((self as Character))
	looking_towards = Vector2.LEFT


func on_dead(_position):
	Global.add_points(points)


func get_class():
	return "EnemyBase"


func activate():
	if activated:
		return

	print("EnemyBase.activate()")
	on_activate()
	activated = true
	emit_signal("activate")


func on_activate():
	pass


func on_screen_exited():
	queue_free()
