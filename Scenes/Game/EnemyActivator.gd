class_name EnemyActivator
extends Area2D

var speed = 5


func _ready():
	connect("body_entered", self, "activate_activable")
	connect("area_entered", self, "activate_activable")
	call_deferred("setup")


func setup():
	Global.set_enemy_activator(self)


func _process(delta):
	global_position.x += speed * delta


func activate_activable(activable:Node):
	print("EnemyActivator.activate_activable: ", activable.get_class())
	if activable.has_method("activate"):
		activable.activate()


func stop():
	speed = 0
