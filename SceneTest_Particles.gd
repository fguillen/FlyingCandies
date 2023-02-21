extends Node2D

onready var particles:CPUParticles2D = $Particles

func _ready():
	particles.emitting = true


func _process(delta):
	global_position.y += 10 * delta
