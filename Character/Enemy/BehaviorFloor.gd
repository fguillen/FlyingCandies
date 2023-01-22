class_name BehaviorFloor
extends Behavior

export var shoot_time := Vector2(1, 5)

onready var timer_shoot := Timer.new()
onready var timer_release := Timer.new()

var rng = RandomNumberGenerator.new()


func _ready():
	timer_shoot.connect("timeout", self, "_on_TimerShoot_timeout")
	timer_release.connect("timeout", self, "_on_TimerRelease_timeout")
	rng.randomize()

func setup(character:Character):
	.setup(character)

	add_child(timer_shoot)
	add_child(timer_release)

	shoot()



func shoot():
	character.input_manager.attacking = true
	timer_release.start(0.1)

	var shoot_in_seconds = rng.randi_range(shoot_time.x, shoot_time.y)
	print("Next shoot in: ", shoot_in_seconds)
	timer_shoot.start(shoot_in_seconds)


func _on_TimerShoot_timeout():
	shoot()


func _on_TimerRelease_timeout():
	character.input_manager.attacking = false
