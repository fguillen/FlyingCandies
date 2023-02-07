class_name CollectableWeapon
extends CollectableBase


export (Resource) var weapon_template = null


func on_collected(player:Player, _position:Vector2):
	var weapon = weapon_template.instance()
	print("CollectableWeapon.on_collected(%s, %s, %s)" % [player, _position, weapon])
	player.weapon_manager.add_weapon(weapon)
