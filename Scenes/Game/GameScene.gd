extends Node

onready var audio_stream_player_game:AudioStreamPlayer = $AudioStreamPlayerGame
onready var audio_stream_player_boss:AudioStreamPlayer = $AudioStreamPlayerBoss

var boss_music_initial_volume_db:float


func _ready():
	boss_music_initial_volume_db = audio_stream_player_boss.volume_db


func music_game_start():
	audio_stream_player_game.play()


func music_game_stop():
	audio_stream_player_game.stop()


func music_boss_start():
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(
		audio_stream_player_boss,
		"volume_db",
		-80,
		boss_music_initial_volume_db,
		6,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	tween.start()
	audio_stream_player_boss.play()


func music_boss_stop():
	audio_stream_player_boss.stop()
