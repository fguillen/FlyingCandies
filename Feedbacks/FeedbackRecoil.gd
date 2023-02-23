class_name FeedbackRecoil
extends Feedback

export(NodePath) var node_path
onready var node:Node2D = get_node(node_path)

export(float) var impulse = 10.0
export(float) var recoil_duration = 0.2
export(float) var recover_duration = 0.5

onready var tween:Tween = $Tween

var original_position:Vector2
var recoling := false


func perform(_position:Vector2, direction:Vector2 = Vector2.ZERO):
	var proc_seed = OS.get_system_time_msecs()

	# print("[%s] perform" % proc_seed)
	if not recoling:
		original_position = node.position
		# print("[%s] original_position: " % proc_seed, original_position)

	recoling = true
	node.position = original_position

	if tween.is_active():
		# print("[%s] tween is_active" % proc_seed)
		# tween.remove(node, "position")
		return


	recoil(original_position, -direction, impulse, proc_seed)
	# tween.remove(node, "position")
	# tween.stop(node, "position")

	yield(tween, "tween_completed")
	# print("[%s] recoil completed" % proc_seed)

	# if tween.is_active(): return

	recover(original_position, proc_seed)
	yield(tween, "tween_completed")
	# print("[%s] recover completed" % proc_seed)

	emit_signal("finished")
	# print("[%s] finished: " % proc_seed, original_position, ", ", node.position)
	node.position = original_position
	recoling = false


func recoil(original_position, direction, impulse, _proc_seed):
	# print("[%s] recoil: " % proc_seed, original_position)
	tween.interpolate_property(
		node,
		"position",
		node.position,
		original_position + (direction * impulse),
		recoil_duration,
		Tween.TRANS_EXPO,
		Tween.EASE_OUT
	)
	tween.start()


func recover(original_position, _proc_seed):
	# print("[%s] recover: " % proc_seed, original_position)
	tween.interpolate_property(
		node,
		"position",
		node.position,
		original_position,
		recover_duration,
		Tween.TRANS_LINEAR,
		Tween.EASE_OUT
	)
	tween.start()
