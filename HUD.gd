extends Control


func _ready():
	var _i = Global.connect("points_changed", self, "on_points_changed")

func on_points_changed(value):
	print("points_changed", value)
