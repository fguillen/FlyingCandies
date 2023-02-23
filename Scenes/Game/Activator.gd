class_name Activator
extends Area2D


signal activate()


func activate():
	print("Activator.activate()")
	emit_signal("activate")
