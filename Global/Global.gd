extends Node

var points = 0
var player = null
var battleship = null
var enemy_activator = null
var player_dead = false
var battleship_dead = false
var camera = null
var pilot = null

signal points_changed(value)
signal shields_changed(value)
signal shields_full_changed(value)
signal player_set(player)
signal battleship_set(battleship)
signal enemy_activator_set(enemy_activator)
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


func set_battleship(battleship):
	print("Global.set_battleship()")
	self.battleship = battleship

	battleship.connect("dead", self, "on_battleship_dead")
	emit_signal("battleship_set", battleship)


func set_enemy_activator(enemy_activator):
	print("Global.set_enemy_activator()")
	self.enemy_activator = enemy_activator

	emit_signal("enemy_activator_set", enemy_activator)


func on_player_dead(_position):
	player_dead = true
	yield(get_tree().create_timer(4.0), "timeout")
	SceneSwitcher.load_game_over()


func on_battleship_dead():
	battleship_dead = true


func enemy_defeated():
	SceneSwitcher.load_success()


func on_player_health_changed(value):
	print("Global.on_player_health_changed(%s)" % str(value))
	set_shields_full(value - 1)
	emit_signal("player_health_changed", value)


func on_projectile_hit(position:Vector2):
	emit_signal("projectile_hit", position)


func add_projectile(projectile:BaseProjectile):
	projectile.connect("hit", self, "on_projectile_hit")
