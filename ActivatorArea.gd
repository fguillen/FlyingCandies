extends Area2D

var speed = 10

func _ready():
	var _i = connect("body_entered", self, "activate_enemy")

func _process(delta):
	global_position.x += speed * delta

func activate_enemy(enemy:Enemy):
	enemy.activate()
