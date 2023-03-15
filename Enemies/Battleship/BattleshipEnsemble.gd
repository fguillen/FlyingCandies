extends Node2D

var weapons := []
var num_weapons := 0

signal dead()

func _ready():
	print("BattleshipEnsemble.ready")
	_load_weapons()
	call_deferred("setup")


func setup():
	Global.set_battleship(self)


func _load_weapons() -> void:
	for node in $"%Weapons".get_children():
		if(node is EnemyBase):
			node.connect("dead", self, "_on_weapon_destroyed")
			num_weapons += 1
			weapons.append(node)


func _on_weapon_destroyed(_position) -> void:
	num_weapons -= 1
	if num_weapons == 0:
		destroy()


func destroy():
	emit_signal("dead")
