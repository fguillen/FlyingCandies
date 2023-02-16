extends Node

export(NodePath) var sprite_path
onready var sprite:Sprite = get_node(sprite_path)


func _process(_delta):
	# print("is inside: ", is_inside())
	# var viewport_size = sprite.get_viewport_rect().size
	# var sprite_position_in_viewport = sprite.get_global_transform_with_canvas().origin
	# print("sprite_position_in_viewport: ", sprite_position_in_viewport)
	# var clamped_x = clamp(sprite_position_in_viewport.x, 0, viewport_size.x)
	# var clamped_y = clamp(sprite_position_in_viewport.y, 0, viewport_size.y)
	# sprite.global_position = Vector2(clamped_x, clamped_y)
	sprite.offset = calculate_offset()


# func is_inside() -> bool:
# 	var viewport_size = sprite.get_viewport_rect().size
# 	var sprite_position_in_viewport = sprite.get_global_transform_with_canvas().origin

# 	return (
# 		(sprite_position_in_viewport.x > 0 and (sprite_position_in_viewport.x + sprite.texture.get_width()) < viewport_size.x)
# 		and (sprite_position_in_viewport.y > 0 and (sprite_position_in_viewport.y + sprite.texture.get_height()) < viewport_size.y)
# 	)

func calculate_offset() -> Vector2:
	# if is_inside(): return Vector2.ZERO

	var viewport_size = sprite.get_viewport_rect().size
	var sprite_position_in_viewport = sprite.get_global_transform_with_canvas().origin
	var offset = Vector2.ZERO

	if (sprite_position_in_viewport.x < 0):
		offset.x = -sprite_position_in_viewport.x

	if (sprite_position_in_viewport.y < 0):
		offset.t = -sprite_position_in_viewport.y

	if ((sprite_position_in_viewport.x + sprite.texture.get_width()) > viewport_size.x):
		offset.x = viewport_size.x - (sprite_position_in_viewport.x + sprite.texture.get_width())

	if ((sprite_position_in_viewport.y + sprite.texture.get_height()) > viewport_size.y):
		offset.y = viewport_size.y - (sprite_position_in_viewport.y + sprite.texture.get_height())


	return offset
