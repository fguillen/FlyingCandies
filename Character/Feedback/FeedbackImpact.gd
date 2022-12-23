class_name FeedbackImpact
extends Feedback

onready var particles: = $Particles

func _ready():
	print("particles: ", particles)
	assert(particles != null)
	particles.get_parent().remove_child(particles)
	get_tree().current_scene.add_child(particles)

func perform(position:Vector2):
	particles.global_position = position
	print("Emitting particles: ", position)
	particles.emitting = true


func _on_ProjectileLaser_hit(position:Vector2):
	perform(position)
