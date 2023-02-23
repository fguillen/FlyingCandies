extends Node2D

onready var player:Player = $Player

func _ready():
	var weapon_laser = preload("res://Weapons/Laser/WeaponLaser.tscn")
	player.weapon_manager.add_weapon(weapon_laser.instance())
	player.weapon_manager.add_weapon(weapon_laser.instance())
	player.weapon_manager.add_weapon(weapon_laser.instance())
	player.weapon_manager.add_weapon(weapon_laser.instance())
