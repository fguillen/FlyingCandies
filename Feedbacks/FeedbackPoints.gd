class_name FeedbackPoints
extends Feedback

export(int) var points = 10

onready var animation_player := $AnimationPlayer
onready var label := $Label


func _ready():
	label.visible = false
	label.text = str(points)


func perform(position:Vector2) -> void:
	label.visible = true
	animation_player.play("Play")
	global_position = position


func on_animation_finished():
	emit_signal("finished")
	queue_free()


func _on_AnimationPlayer_animation_finished(_anim_name:String):
	on_animation_finished()
