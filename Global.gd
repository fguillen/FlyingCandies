extends Node

var points = 0
var player = null
var player_dead = false

signal points_changed(value)
signal shields_changed(value)
signal shields_full_changed(value)


func add_points(value):
	points += value
	emit_signal("points_changed", points)


func set_shields(value):
	emit_signal("shields_changed", value)


func set_shields_full(value):
	emit_signal("shields_full_changed", value)


func set_player(player):
	self.player = player
	set_shields(player.damage_manager.health)
	set_shields_full(player.damage_manager.health)
