class_name ShieldUI
extends Control

export (NodePath) var texture_full_path
export (NodePath) var texture_empty_path

onready var texture_full := $Full
onready var texture_empty := $Empty

var full setget set_full


func _ready():
	set_full(true)


func set_full(value:bool):
	full = value
	texture_full.visible = value
	texture_empty.visible = !value
