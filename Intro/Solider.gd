extends AnimatedSprite

onready var timer_step = $TimerStep

var random = RandomNumberGenerator.new()

signal walk_step()

func _init():
	random.randomize()


func _ready():
	speed_scale = random.randf_range(0.8, 1.2)


func walk():
	animation = "Walk"
	timer_step.start()


func idle():
	animation = "Idle"
	timer_step.stop()


func _walk_step():
	emit_signal("walk_step")


func _on_TimerStep_timeout():
	_walk_step()
