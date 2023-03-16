class_name FeedbackParticles
extends Feedback


onready var particles: = $Particles



func perform(position:Vector2 = Vector2.ZERO):
	if position != Vector2.ZERO:
		particles.global_position = position

	if not particles.emitting:
		particles.emitting = true
