class_name Feedback
extends Node2D

signal finished()

func perform(_position:Vector2):
	emit_signal("finished")
