class_name EnemyActivator
extends Area2D

export var speed:float = 5.0
var current_speed:float


func _ready():
	connect("body_entered", self, "activate_activable")
	connect("area_entered", self, "activate_activable")
	call_deferred("setup")
	current_speed = speed


func setup():
	Global.set_enemy_activator(self)


func _process(delta):
	global_position.x += current_speed * delta


func activate_activable(activable:Node):
	print("EnemyActivator.activate_activable: ", activable.get_class())
	if activable.has_method("activate"):
		activable.activate()


func stop():
	current_speed = 0


func start():
	current_speed = speed
