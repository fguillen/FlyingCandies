class_name Character
extends Area2D


export var state_machine_path := NodePath()
export var input_manager_path := NodePath()
export var movement_manager_path := NodePath()
export var animation_player_path := NodePath()
export var weapon_manager_path := NodePath()


onready var input_manager: InputManager = get_node(input_manager_path)
onready var movement_manager: MovementManager = get_node(movement_manager_path)
onready var animation_player: AnimationPlayer = get_node(animation_player_path)
onready var state_machine: StateMachine = get_node(state_machine_path)
onready var weapon_manager: WeaponManager = get_node(weapon_manager_path)

func get_class():
	return "Character"

func move(velocity:Vector2):
	global_position = global_position + velocity

func get_hit(damage:int):
	print("Damage received: ", damage)
