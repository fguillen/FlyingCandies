extends Node

export var node_path = NodePath()

export (int) var top = 0
export (int) var down = 1000
export (int) var left = 0
export (int) var right = 1000

onready var node:Node2D = get_node(node_path)


func _physics_process(delta):
	var node_screen_position = get_position_on_screen(node)

	if node_screen_position.x < left:
		node_screen_position.x = left

	if node_screen_position.x > right:
		node_screen_position.x = right

	if node_screen_position.y < top:
		node_screen_position.y = top

	if node_screen_position.y > down:
		node_screen_position.y = down

	set_on_screen_position(node, node_screen_position)

func get_position_on_screen(node: Node2D) -> Vector2:
	return node.get_global_transform_with_canvas().origin

func set_on_screen_position(node: Node2D, screen_position:Vector2):
	var canvas_position = node.get_canvas_transform().origin
	node.global_position = screen_position - canvas_position

# func set_on_screen_position(node: Node2D, screen_position:Vector2):
# 	var canvas_position = node.get_viewport().get_visible_rect().position
# 	print("canvas_position: ", canvas_position)
# 	print("Camera.get_screen_center_position(): ", node.get_viewport().get_camera_2d().get_screen_center_position())
# 	node.global_position = canvas_position + screen_position
