class_name ShipEngine
extends Node2D

export(Array) var sprites: = []

func _ready():
	for child in get_children():
		if child is Sprite:
			sprites.append(child)

func activate():
	for sprite in sprites:
		sprite.set_visible(true)

func deactivate():
	for sprite in sprites:
		sprite.set_visible(false)
