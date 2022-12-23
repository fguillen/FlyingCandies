class_name StateManager
extends Node

signal transitioned(state_name)

export var initial_state_path := NodePath()

export(bool) var debug := false
export(int) var actual_state := 0

onready var state: State = get_node(initial_state_path)


func setup(character, initial_state:String = "Idle") -> void:
	for child in get_children():
		child.character = character

	transition_to(initial_state)


func handle_input(event: InputEvent) -> void:
	state.handle_input(event)


func process(delta: float) -> void:
	state.process(delta)


func physics_process(delta: float) -> void:
	state.physics_process(delta)


func transition_to(target_state_name: String, msg: Dictionary = {}) -> void:
	if(debug): print("StateMachine.transition_to(%s)" % target_state_name)

	var node_name = "State%s" % target_state_name
	assert(has_node(node_name), "State Node not found: '%s'" % node_name)
	actual_state = 10
	property_list_changed_notify()

	state.exit()
	state = get_node(node_name)
	state.enter(msg)
	emit_signal("transitioned", state.name)


func animation_ended() -> void:
	state.animation_ended()


func on_collision(collision:KinematicCollision2D):
	state.on_collision(collision)
