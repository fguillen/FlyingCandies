class_name WeaponsUI
extends Control




var weapon_uis = []

func _ready():
	Global.connect("player_set", self, "_on_player_set")


func register(weapon_ui:WeaponUI) -> void:
	print("WeaponsUI.register(%s)" % weapon_ui)
	weapon_uis.append(weapon_ui)


func get_class() -> String:
	return "WeaponsUI"


func _on_weapon_added(weapon:WeaponBase) -> void:
	for weapon_ui in weapon_uis:
		if weapon_ui.set_weapon(weapon):
			return

	push_warning("WeaponUI._on_weapon_added() not WeaponUI free found")


func _on_player_set(player) -> void:
	player.weapon_manager.connect("weapon_added", self, "_on_weapon_added")

	for weapon_already_added in player.weapon_manager.weapons:
		_on_weapon_added(weapon_already_added)
