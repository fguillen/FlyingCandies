extends Node


func _ready():
	pass


func _on_Area2D_body_entered(_body:Node):
	print("_on_Area2D_body_entered")


func _on_Area2D_area_entered(_area:Area2D):
	print("_on_Area2D_area_entered")
