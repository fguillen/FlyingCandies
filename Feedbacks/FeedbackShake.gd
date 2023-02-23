class_name FeedbackShake
extends Feedback

export(NodePath) var node_path
onready var node:Node2D = get_node(node_path)

export(float) var duration = 0.0
export(float) var frequency = 0.0
export(float) var amplitude = 0.0
export(float) var priority = 0.0

onready var tween_shake: = $TweenShake
onready var timer_duration: = $TimerDuration
onready var timer_frequency: = $TimerFrequency

var original_position := Vector2.ZERO
var shaking = false


func perform(_position:Vector2):
	shake(duration, frequency, amplitude, priority)

func shake(duration = 0.2, frequency = 15, amplitude = 16, priority = 0):
	if (priority >= self.priority):
		if !shaking:
			original_position = node.position

		shaking = true

		self.priority = priority
		self.amplitude = amplitude

		timer_duration.wait_time = duration
		timer_frequency.wait_time = 1 / float(frequency)
		timer_duration.start()
		timer_frequency.start()

		_new_shake()


func _new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)

	tween_shake.interpolate_property(
		node,
		"position",
		node.position,
		rand + original_position,
		timer_frequency.wait_time,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	tween_shake.start()


func _reset():
	tween_shake.interpolate_property(
		node,
		"position",
		node.position,
		original_position,
		timer_frequency.wait_time,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	tween_shake.start()

	shaking = false
	priority = 0


func _on_TimerFrequency_timeout():
	_new_shake()


func _on_TimerDuration_timeout():
	_reset()
	timer_frequency.stop()
