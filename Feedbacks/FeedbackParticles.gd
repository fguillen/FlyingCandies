class_name FeedbackParticles
extends Feedback


onready var particles: = $Particles

export var reparent:bool


func _ready():
	assert(particles != null)

	if reparent:
		particles.get_parent().remove_child(particles)
		get_tree().current_scene.call_deferred("add_child", particles)


func perform(position:Vector2 = Vector2.ZERO):
	if position != Vector2.ZERO:
		particles.global_position = position

	if not particles.emitting:
		particles.emitting = true
