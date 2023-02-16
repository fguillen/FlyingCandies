class_name MiniMap
extends Control


export var progress := 0.0


onready var ini_position:float = $Ini.global_position.x
onready var end_position:float = $End.global_position.x
onready var marker := $Marker

var player
var battleship

var real_ini_position:float
var real_end_position:float


func _ready():
	Global.connect("player_set", self, "on_player_set")
	Global.connect("battleship_set", self, "on_battleship_set")


func _process(_delta):
	if(real_ini_position != null and real_end_position != null):
		_calculate_progress()
		marker.global_position.x = lerp(ini_position, end_position, progress)


func on_player_set(player):
	print("MiniMap.on_player_set")
	self.player = player
	real_ini_position = player.global_position.x


func on_battleship_set(battleship):
	print("MiniMap.on_battlehip_set")
	self.battleship = battleship
	real_end_position = battleship.global_position.x


func _calculate_progress():
	progress = (player.global_position.x - real_ini_position) / (real_end_position - real_ini_position)
