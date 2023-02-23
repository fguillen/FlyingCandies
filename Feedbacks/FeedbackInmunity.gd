class_name FeedbackInmunity
extends Feedback

export (float) var time_seconds = 1.0
export var collision_shape_path := NodePath()

onready var collision_shape:CollisionShape2D = get_node(collision_shape_path)
onready var timer: = $Timer

func _ready():
	print("CollisionShape: ", collision_shape)


func perform(_position:Vector2 = Vector2.ZERO):
	print("FeedbackInmunity.perform()")
	collision_shape.disabled = true

	timer.start(time_seconds)
	yield(timer, "timeout")

	collision_shape.disabled = false
	emit_signal("finished")
