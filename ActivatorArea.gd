class_name ActivatorArea
extends Area2D

var speed = 5


func _ready():
	connect("body_entered", self, "activate_activable")
	connect("area_entered", self, "activate_activable")


func _process(delta):
	global_position.x += speed * delta


func activate_activable(activable:Node):
	print("ActivatorArea.activate_activable: ", activable.get_class())
	if activable.has_method("activate"):
		activable.activate()
