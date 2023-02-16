extends Node2D

func _ready():
	print("BattleshipEnsemble.ready")
	call_deferred("setup")


func setup():
	Global.set_battleship(self)
