class_name FeedbackShakeNoise
extends Feedback

export(NodePath) var camera_path
onready var camera:Camera2D = get_node(camera_path)

export(float) var amplitude = 60.0
export(float) var period = 2.0
export(float) var speed = 30.0
export(float) var decay_rate = 5.0

var rand := RandomNumberGenerator.new()
var noise := OpenSimplexNoise.new()

var shake_strength := 0.0
var noise_index := 0.0
var is_shaking = false


func perform(_position:Vector2):
	shake(amplitude, period, speed, decay_rate)


func shake(amplitude, period, speed, decay_rate):
	is_shaking = true
	noise.seed = rand.randi()
	noise.period = period
	self.speed = speed
	self.decay_rate = decay_rate
	noise_index = 0
	shake_strength = amplitude


func _ready() -> void:
	rand.randomize()


func _process(delta: float) -> void:
	if !is_shaking: return

	shake_strength = lerp(shake_strength, 0, decay_rate * delta) # Fade out the intensity over time

	if(shake_strength < 0.1):
		camera.offset = Vector2.ZERO
		is_shaking = false
	else:
		camera.offset = _get_noise_offset(delta) * shake_strength


func _get_noise_offset(delta: float) -> Vector2:
	noise_index += delta * speed
	return Vector2(
		noise.get_noise_2d(1, noise_index),
		noise.get_noise_2d(100, noise_index)
	)
