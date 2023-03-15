extends Node2D


func _on_collision(node:Node):
	node.queue_free()


func _on_Area2D_body_entered(body:Node):
	_on_collision(body)
