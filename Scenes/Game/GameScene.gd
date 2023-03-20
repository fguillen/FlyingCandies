extends Node

onready var audio_stream_player_game:AudioStreamPlayer = $AudioStreamPlayerGame
onready var audio_stream_player_boss:AudioStreamPlayer = $AudioStreamPlayerBoss


func music_game_start():
	audio_stream_player_game.play()


func music_game_stop():
	audio_stream_player_game.stop()


func music_boss_start():
	audio_stream_player_boss.play()


func music_boss_stop():
	audio_stream_player_boss.stop()
