extends Node

var points = 0

signal points_changed(value)

func add_points(value):
	points += value
	emit_signal("points_changed", points)
