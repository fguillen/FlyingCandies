class_name CollectableBase
extends Node2D


onready var area2d:Area2D = $Area2D


signal collected_by(player)
signal collected_at(position)


func _ready():
	area2d.connect("body_entered", self, "on_body_entered")


func on_body_entered(player:Player):
	emit_signal("collected_by", player)
	emit_signal("collected_at", global_position)
	on_collected(player, global_position)
	queue_free()


func on_collected(_player:Player, _position:Vector2):
	pass
