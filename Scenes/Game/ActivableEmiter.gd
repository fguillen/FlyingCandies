class_name ActivableEmitter
extends Area2D


signal activate()


func activate():
	print("AreaactivateEmitter.activate()")
	emit_signal("activate")
