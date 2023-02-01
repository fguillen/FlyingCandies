class_name CollectableStar
extends CollectableBase


export(int) var points = 10


func on_collected(_player:Player, _position:Vector2):
	Global.add_points(points)
