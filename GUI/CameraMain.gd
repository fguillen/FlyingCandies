class_name CameraMain
extends Camera2D

signal shake_big()
signal shake_small()


func _ready():
	Global.camera = self
	Global.connect("player_health_changed", self, "shake_big")
	Global.connect("projectile_hit", self, "shake_small")


func shake_big(_value):
	emit_signal("shake_big")


func shake_small(_value):
	emit_signal("shake_small")
