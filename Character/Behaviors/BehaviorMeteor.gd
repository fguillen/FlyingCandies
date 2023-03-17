class_name BehaviorMeteor
extends BehaviorBase

const FALLING_DELAY = Vector2(8.0, 16.0)
const SPEED_RANGE = Vector2(10, 20)
const DIRECTION_ROTATE = Vector2(-15, 15)
const ROTATION = Vector2(-50, 50)

var rng = RandomNumberGenerator.new()
var rotation:float


func _ready():
	rng.randomize()
	rotation = deg2rad(rng.randf_range(ROTATION.x, ROTATION.y))


func setup(character:Character):
	print("BehaviourMeteor.setup")
	.setup(character)

	character.speed = 0
	character.connect("activate", self, "_start_falling")


func on_process(delta):
	character.rotation += rotation * delta


func _start_falling():
	print("BehaviourMeteor._start_falling()")
	var falling_delay = rng.randf_range(FALLING_DELAY.x, FALLING_DELAY.y)
	yield(get_tree().create_timer(falling_delay), "timeout")
	print("BehaviourMeteor._start_falling() (2)")
	character.speed = rng.randf_range(SPEED_RANGE.x, SPEED_RANGE.y)
	character.input_manager.move_direction = Vector2.DOWN.rotated(
				deg2rad(
					rng.randf_range(
						DIRECTION_ROTATE.x,
						DIRECTION_ROTATE.y
					)
				)
			)
