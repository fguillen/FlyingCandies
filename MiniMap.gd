class_name MiniMap
extends Control


export var progress := 0.0


onready var ini_map_position:float = $Ini.global_position.x
onready var end_map_position:float = $End.global_position.x
onready var marker := $Marker

var player
var battleship

var ini_global_position := 0.0
var end_global_position := 0.0


func _ready():
	Global.connect("player_set", self, "on_player_set")
	Global.connect("battleship_set", self, "on_battleship_set")


func _process(_delta):
	if(ini_global_position != 0 and end_global_position != 0):
		_calculate_progress()
		marker.global_position.x = lerp(ini_map_position, end_map_position, progress)


func on_player_set(player):
	print("MiniMap.on_player_set")
	self.player = player
	ini_global_position = player.global_position.x


func on_battleship_set(battleship):
	print("MiniMap.on_battlehip_set")
	self.battleship = battleship
	end_global_position = battleship.global_position.x


func _calculate_progress():
	progress = (player.global_position.x - ini_global_position) / (end_global_position - ini_global_position)
