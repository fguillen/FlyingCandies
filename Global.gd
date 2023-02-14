extends Node

var points = 0
var player = null
var player_dead = false
var camera = null
var pilot = null

signal points_changed(value)
signal shields_changed(value)
signal shields_full_changed(value)
signal player_set(player)
signal player_health_changed(value)
signal projectile_hit(value)


func _ready() -> void:
	print("Global.ready")
	pilot = Pilot.new()
	pilot.randomize()


func add_points(value):
	points += value
	emit_signal("points_changed", points)


func set_shields(value):
	emit_signal("shields_changed", value)


func set_shields_full(value):
	emit_signal("shields_full_changed", value)


func set_player(player):
	print("Global.set_player()")
	self.player = player
	set_shields(player.damage_manager.health - 1)
	set_shields_full(player.damage_manager.health - 1)

	player_dead = false

	player.connect("dead", self, "on_player_dead")
	player.connect("health_changed", self, "on_player_health_changed")

	emit_signal("player_set", player)



func on_player_dead(_position):
	player_dead = true
	SceneSwitcher.load_game_over()


func on_player_health_changed(value):
	print("Global.on_player_health_changed(%s)" % str(value))
	set_shields_full(value - 1)
	emit_signal("player_health_changed", value)


func on_projectile_hit(position:Vector2):
	emit_signal("projectile_hit", position)


func add_projectile(projectile: ProjectileBase):
	projectile.connect("hit", self, "on_projectile_hit")
