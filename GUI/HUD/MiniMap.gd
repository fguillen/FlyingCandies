class_name MiniMap
extends Control


export var progress := 0.0


onready var ini_map_position:float = $Ini.global_position.x
onready var end_map_position:float = $End.global_position.x
onready var marker := $Marker

var enemy_activator
var battleship

var ini_global_position := 0.0
var end_global_position := 0.0


func _ready():
	Global.connect("enemy_activator_set", self, "on_enemy_activator_set")
	Global.connect("battleship_set", self, "on_battleship_set")


func _process(_delta):
	if(ini_global_position != 0 and end_global_position != 0):
		_calculate_progress()
		marker.global_position.x = lerp(ini_map_position, end_map_position, progress)


func on_enemy_activator_set(enemy_activator):
	print("MiniMap.on_enemy_activator_set")
	self.enemy_activator = enemy_activator
	ini_global_position = enemy_activator.global_position.x


func on_battleship_set(battleship):
	print("MiniMap.on_battleship_set")
	self.battleship = battleship
	end_global_position = battleship.global_position.x


func _calculate_progress():
	progress = (enemy_activator.global_position.x - ini_global_position) / (end_global_position - ini_global_position)
