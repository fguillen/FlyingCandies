class_name FeedbackFloating
extends Feedback

export(int) var distance = 10
export(float) var time = 1.0
export(NodePath) var node2D_path

onready var node2D: Node2D = get_node(node2D_path)
onready var tween := $Tween


var position_start:Vector2 = Vector2.ZERO
var position_down:Vector2 = Vector2.ZERO
var position_up:Vector2 = Vector2.ZERO

# func _ready():
# 	print("FeedbackFloating.ready()")


func perform(_position:Vector2) -> void:
	position_start = node2D.global_position
	position_down = position_start
	position_up = position_start + Vector2(0, -distance)

	animate()


func float_up() -> void:
	tween.interpolate_property(
		node2D,
		"position",
		position_down,
		position_up,
		time,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	tween.start()


func float_down() -> void:
	tween.interpolate_property(
		node2D,
		"position",
		position_up,
		position_down,
		time,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	tween.start()


func animate():
	while(is_instance_valid(self)):
		float_up()
		# print("FeedbackFloating.is_instance_valid1() ", is_instance_valid(self))
		yield(tween, "tween_completed")
		# print("FeedbackFloating.is_instance_valid2() ", is_instance_valid(self))
		float_down()
		yield(tween, "tween_completed")


func _on_FeedbackFloating_tree_exiting():
	pass # Replace with function body.
