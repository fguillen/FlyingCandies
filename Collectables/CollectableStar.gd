class_name CollectableStar
extends CollectableBase


export(int) var points = 10


func on_collected(_player:Player, _position:Vector2):
	print("CollectableStar.points: ", points)
	Global.add_points(points)
