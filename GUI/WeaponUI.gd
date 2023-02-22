class_name WeaponUI
extends Control

onready var sprite:Sprite = $Sprite

var weapon_name:String = ""
var count := 0


func _ready():
	print("XXX: weapon_name ", weapon_name == null)
	var weapons_ui = Utils.get_parent_of_type(self, "WeaponsUI")
	weapons_ui.register(self)


func set_weapon(weapon:WeaponBase) -> bool:
	if weapon_name != "" and weapon_name != weapon.weapon_name():
		return false # no accepted

	if weapon_name == "":
		weapon_name = weapon.weapon_name()
		sprite.texture = weapon.get_texture()

	count += 1

	return true # accepted
