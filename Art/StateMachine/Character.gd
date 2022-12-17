class_name Character
extends KinematicBody2D

export(Vector2) var velocity: = Vector2.ZERO
export(float) var speed: = 10.0
export var state_machine_path := NodePath()
export var input_manager_path := NodePath()


onready var state_machine: StateMachine = get_node(state_machine_path)
onready var input_manager: InputManager = get_node(input_manager_path)
