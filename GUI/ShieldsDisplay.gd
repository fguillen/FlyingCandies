extends Control

export (Resource) var shield_template

export (int) var num_hearts := 3 setget set_num_hearts

onready var shields_control := $Shields


func _ready():
	set_num_hearts(num_hearts)


func set_num_hearts(value):
	num_hearts = value
	remove_all_shields()
	for i in value:
		add_shield()


func remove_all_shields():
	for child in shields_control.get_children():
		child.queue_free()


func add_shield():
	num_hearts += 1
	var shield = shield_template.instance()
	shields_control.add_child(shield)
