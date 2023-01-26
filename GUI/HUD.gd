extends Control

onready var label_points:Label = $CanvasLayer/Panel/LabelPoints

func _ready():
	var _i = Global.connect("points_changed", self, "on_points_changed")

func on_points_changed(value):
	label_points.set_points(value)
