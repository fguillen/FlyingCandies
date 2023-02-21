class_name FeedbackParticles
extends Feedback


onready var particles: = $Particles

export var reparent:bool


func _ready():
	assert(particles != null)

	print("FeedbackParticles.ready.reparent ", reparent)
	if reparent:
		particles.get_parent().remove_child(particles)
		get_tree().current_scene.call_deferred("add_child", particles)


func perform(position:Vector2):
	particles.global_position = position
	if not particles.emitting:
		particles.emitting = true
