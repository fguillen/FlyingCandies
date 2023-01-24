extends Node

var points = 0
var player = null
var player_dead = false

signal points_changed(value)

func add_points(value):
	points += value
	emit_signal("points_changed", points)


func set_player(player):
	self.player = player
