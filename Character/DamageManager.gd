class_name DamageManager
extends Node

var max_health = 2

var health setget set_health,get_health

signal out_of_health
signal health_changed(value)


func _ready():
	self.health = max_health


func get_hit(damage:int) -> void:
	self.health -= damage


func set_health(value:int):
	value = clamp(value, 0, max_health) as int

	if health != value:
		health = value
		emit_signal("health_changed", health)

		if health == 0:
			emit_signal("out_of_health")


func get_health() -> int:
	return health
