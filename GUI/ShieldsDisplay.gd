class_name ShieldDisplay
extends Control

export (Resource) var shield_template

export (int) var ini_num_shields := 1
export (int) var ini_num_shields_full := 1


var shields = []
var initialized = false

onready var shields_control := $Shields


func _ready():
	if !initialized:
		setup(ini_num_shields, ini_num_shields_full)


func setup(num_shields, num_shields_full):
	set_num_shields(num_shields)
	set_num_shields_full(num_shields_full)

	initialized = true

func set_num_shields(value):
	remove_all_shields()
	for i in value:
		add_shield()


func set_num_shields_full(value):
	print("set_num_shields_full(%d)" % value)
	value = clamp(value, 0, num_shields())
	print("set_num_shields_full(%d)" % value)

	if value > num_shields_full():
		add_shield_full()
		set_num_shields_full(value)

	elif value < num_shields_full():
		remove_shield_full()
		set_num_shields_full(value)


func add_shield_full():
	print("add_shield_full")

	if num_shields_full() == num_shields():
		print("All shields already full but trying to full another one")
		return

	print("num_shields_full: ", num_shields_full(), " ,", num_shields())
	shields[num_shields_full()].full = true


func remove_shield_full():
	print("remove_shield_full")

	if num_shields_full() == 0:
		print("All shields already empty but trying to empty another one")
		return

	print("num_shields_full: ", num_shields_full(), " ,", num_shields(), " ,", shields_control.get_child_count())
	shields[num_shields_full() - 1].full = false


func remove_all_shields():
	shields = []
	for child in shields_control.get_children():
		child.queue_free()


func add_shield():
	var shield = shield_template.instance()
	shields_control.add_child(shield)

	shields.append(shield)


func num_shields() -> int:
	return shields.size()


func num_shields_full() -> int:
	var result = 0

	for shield in shields:
		if shield.full: result += 1

	return result
