class_name Character
extends KinematicBody2D


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

signal out_of_health(position)
signal dead(position)
signal hit(position)

var looking_towards = Vector2.RIGHT


func _ready():
	# warning-ignore:return_value_discarded
	damage_manager.connect("health_changed", self, "on_health_changed")

	# warning-ignore:return_value_discarded
	damage_manager.connect("out_of_health", self, "on_out_of_health")

	state_manager.setup(self, "Idle")
	weapon_manager.setup(self)


func _unhandled_input(event: InputEvent) -> void:
	state_manager.handle_input(event)


func _process(delta: float) -> void:
	state_manager.process(delta)


func _physics_process(delta: float) -> void:
	state_manager.physics_process(delta)
	var collision = move_and_collide(movement_manager.velocity * delta)
	if collision != null:
		state_manager.on_collision(collision)


func get_class():
	return "Character"


func get_hit(damage:int, position:Vector2):
	damage_manager.get_hit(damage)
	emit_signal("hit", position)


func on_health_changed(value:int):
	print("on_health_changed: ", value)


func on_out_of_health():
	print("Out of health")
	emit_signal("out_of_health", global_position)
	state_manager.transition_to("Dead")


func on_animation_ended():
	state_manager.animation_ended()


func dead():
	emit_signal("dead", global_position)
	queue_free()
