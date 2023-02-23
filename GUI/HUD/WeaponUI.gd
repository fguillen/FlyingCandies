class_name WeaponUI
extends Control

onready var sprite:Sprite = $Sprite
onready var label:Label = $Label

var weapon_name:String = ""
var count := 0


func _ready():
	sprite.texture = null
	label.text = ""

	var weapons_ui = Utils.get_parent_of_type(self, "WeaponsUI")

	if weapons_ui != null:
		weapons_ui.register(self)
	else:
		push_warning("Parent WeaponsUI not found")



func set_weapon(weapon:BaseWeapon) -> bool:
	if weapon_name != "" and weapon_name != weapon.weapon_name():
		return false # no accepted

	if weapon_name == "":
		weapon_name = weapon.weapon_name()
		sprite.texture = weapon.get_texture()

	count += 1

	if count > 1:
		label.text = "x%d" % count
	else:
		label.text = ""

	return true # accepted
