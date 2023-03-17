class_name CollectableDropper
extends Node2D

export (Array, Resource) var collectable_options

var _chances_sum := 0.0
var random = RandomNumberGenerator.new()


func _ready():
	random.randomize()

	for collectable_option in collectable_options:
		print(collectable_option.collectable, collectable_option.chances)
		_chances_sum += collectable_option.chances


func perform(position:Vector2):
	print("CollectableDropper.perform()", position)
	var collectable_scene := _get_random_collectable()

	if not collectable_scene:
		return

	var collectable_instance := collectable_scene.instance() as CollectableBase
	collectable_instance.global_position = position
	get_tree().current_scene.add_child(collectable_instance)
	print("collectable_instance.global_position", collectable_instance.global_position)


func _get_random_collectable() -> PackedScene:
	var chances_index := 0.0
	var chances_value = random.randf_range(0.0, _chances_sum)

	for collectable_option in collectable_options:
		chances_index += collectable_option.chances
		if chances_value <= chances_index:
			print("_chances_sum", _chances_sum)
			print("chances_index", chances_index)
			print("chances_value", chances_value)
			return collectable_option.collectable

	push_warning("CollectableDropper.drop() not CollectableOption chosen")
	return null
