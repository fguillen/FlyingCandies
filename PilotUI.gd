class_name PilotUI
extends Node2D

onready var face_sprite := $Face
onready var eyes_sprite := $Eyes
onready var nose_sprite := $Nose
onready var mouth_sprite := $Mouth
onready var helmet_sprite := $Helmet
onready var body_sprite := $Body

var pilot


func _ready():
	if(pilot == null):
		pilot = Pilot.new()
		pilot.randomize()

	setup(pilot)


func setup(pilot: Pilot) -> void:
	self.pilot = pilot
	update_parts()


func update_parts() -> void:
	face_sprite.frame_coords = Vector2(pilot.face, 0)
	eyes_sprite.frame_coords = Vector2(pilot.eyes, 1)
	nose_sprite.frame_coords = Vector2(pilot.nose, 2)
	mouth_sprite.frame_coords = Vector2(pilot.mouth, 3)
	helmet_sprite.frame_coords = Vector2(pilot.helmet, 4)
	body_sprite.frame_coords = Vector2(pilot.body, 5)
