class_name FeedbackMuzzleBlast
extends Feedback

onready var particles: = $Particles

func _ready():
	print("particles: ", particles)
	assert(particles != null)
	particles.get_parent().remove_child(particles)
	get_tree().current_scene.call_deferred("add_child", particles)

func perform(position:Vector2):
	particles.global_position = position
	if not particles.emitting:
		particles.emitting = true
