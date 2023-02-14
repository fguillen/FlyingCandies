extends Node2D


export(Resource) var audio_file
export(bool) var random_pitch = false

onready var audio_stream_player := $AudioStreamPlayer

var random = RandomNumberGenerator.new()


func _ready():
	assert(audio_stream_player != null)
	audio_stream_player.get_parent().remove_child(audio_stream_player)
	get_tree().current_scene.call_deferred("add_child", audio_stream_player)
	audio_stream_player.stream = audio_file
	random.randomize()


func perform(position: Vector2) -> void:
	global_position = position
	audio_stream_player.pitch_scale = random.randf_range(0.8, 1.2)
	audio_stream_player.play()


func _on_AudioStreamPlayer_finished():
	emit_signal("finished")
