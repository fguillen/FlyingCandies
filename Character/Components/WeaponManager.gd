class_name WeaponManager
extends Node2D

var weapons: = []
var weapon_holders := []
var character
var _weapons_in_holders_cache = null

signal attack()
signal weapon_added(weapon)


func _ready():
	_load_weapon_holders()


func setup(_character) -> void:
	character = _character


func add_weapon(weapon:BaseWeapon) -> void:
	# print("WeaponManager.add_weapon(%s)" % weapon.weapon_name())
	if weapon.get_parent() != null:
		weapon.get_parent().remove_child(weapon)

	weapon.setup(character)

	var weapon_was_added = _add_weapon_to_first_free_weapon_holder(weapon)
	if weapon_was_added:
		weapons.append(weapon)
		emit_signal("weapon_added", weapon)



func attack() -> void:
	var attack_done := false

	for weapon in _weapons_in_holders():
		if weapon.can_attack():
			weapon.attack()
			attack_done = true

	if attack_done:
		emit_signal("attack")


func can_attack() -> bool:
	for weapon in _weapons_in_holders():
		if weapon.can_attack():
			return true

	return false


func _weapons_in_holders() -> Array:
	if _weapons_in_holders_cache != null:
		return _weapons_in_holders_cache

	var result = []

	for weapon_holder in weapon_holders:
		if weapon_holder.has_weapon():
			result.append(weapon_holder.weapon)

	_weapons_in_holders_cache = result

	return result


func _first_free_weapon_holder():
	for weapon_holder in weapon_holders:
		if not weapon_holder.has_weapon():
			return weapon_holder

	return null


func _add_weapon_to_first_free_weapon_holder(weapon) -> bool:
	var free_weapon_holder = _first_free_weapon_holder()

	if free_weapon_holder != null:
		free_weapon_holder.add_weapon(weapon)
		_weapons_in_holders_cache = null
		return true

	push_warning("WeaponManager.add_weapon not free holder found")
	return false


func _load_weapon_holders() -> void:
	for node in get_children():
		if(node is WeaponHolder):
			weapon_holders.append(node)
			node.weapon_manager = self
