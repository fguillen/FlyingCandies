class_name Pilot
extends Node2D

export (int) var face := 0
export (int) var eyes := 0
export (int) var nose := 0
export (int) var mouth := 0
export (int) var helmet := 0
export (int) var body := 0

onready var face_sprite := $Face
onready var eyes_sprite := $Eyes
onready var nose_sprite := $Nose
onready var mouth_sprite := $Mouth
onready var helmet_sprite := $Helmet
onready var body_sprite := $Body

func _ready():
	face_sprite.frame_coords = Vector2(face, 0)
	eyes_sprite.frame_coords = Vector2(eyes, 1)
	nose_sprite.frame_coords = Vector2(nose, 2)
	mouth_sprite.frame_coords = Vector2(mouth, 3)
	helmet_sprite.frame_coords = Vector2(helmet, 4)
	body_sprite.frame_coords = Vector2(body, 5)
