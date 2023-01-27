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
	set_shields(player.damage_manager.health - 1)
	set_shields_full(player.damage_manager.health - 1)

	player_dead = false

	player.connect("dead", self, "on_player_dead")
	player.connect("health_changed", self, "on_player_health_changed")


func on_player_dead(_position):
	player_dead = true
	SceneSwitcher.load_game_over()


func on_player_health_changed(value):
	print("Global.on_player_health_changed(%s)" % str(value))
	set_shields_full(value - 1)
