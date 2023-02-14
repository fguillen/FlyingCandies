extends AnimatedSprite

var random = RandomNumberGenerator.new()


func _init():
	random.randomize()


func _ready():
	speed_scale = random.randf_range(0.8, 1.2)


func walk():
	animation = "Walk"


func idle():
	animation = "Idle"
