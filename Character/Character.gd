class_name Character
extends Area2D


export var state_manager_path := NodePath()
export var input_manager_path := NodePath()
export var movement_manager_path := NodePath()
export var animation_player_path := NodePath()
export var weapon_manager_path := NodePath()
export var damage_manager_path := NodePath()


onready var input_manager: InputManager = get_node(input_manager_path)
onready var movement_manager: MovementManager = get_node(movement_manager_path)
onready var animation_player: AnimationPlayer = get_node(animation_player_path)
onready var state_manager: StateManager = get_node(state_manager_path)
onready var weapon_manager: WeaponManager = get_node(weapon_manager_path)
onready var damage_manager: DamageManager = get_node(damage_manager_path)


func _ready():
	# warning-ignore:return_value_discarded
	damage_manager.connect("health_changed", self, "on_health_changed")

	# warning-ignore:return_value_discarded
	damage_manager.connect("out_of_health", self, "on_out_of_health")

	state_manager.setup(self, "Idle")


func _unhandled_input(event: InputEvent) -> void:
	state_manager.handle_input(event)


func _process(delta: float) -> void:
	state_manager.process(delta)


func _physics_process(delta: float) -> void:
	state_manager.physics_process(delta)


func get_class():
	return "Character"


func move(velocity:Vector2):
	global_position = global_position + velocity


func get_hit(damage:int):
	damage_manager.get_hit(damage)


func on_health_changed(value:int):
	print("on_health_changed: ", value)


func on_out_of_health():
	print("Out of health")
	state_manager.transition_to("Dead")


func on_animation_ended():
	state_manager.animation_ended()
