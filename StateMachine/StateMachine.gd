class_name StateMachine
extends Node

signal transitioned(state_name)

export var initial_state_path := NodePath()

export(bool) var debug := false
export(int) var actual_state := 0

onready var state: State = get_node(initial_state_path)



func _ready() -> void:
	for child in get_children():
		child.character = owner

	state.enter()


func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)


func _process(delta: float) -> void:
	state.process(delta)


func _physics_process(delta: float) -> void:
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
