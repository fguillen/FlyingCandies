extends Node2D

onready var weapon_laser = $WeaponLaser
onready var feedback = $FeedbackChargingEnergy

func _ready():
	feedback.perform(global_position)
	weapon_laser.attack()


func _process(delta):
	feedback.global_position.y += 10 * delta
	weapon_laser.global_position.y += 10 * delta
