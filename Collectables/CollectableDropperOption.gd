class_name CollectableDropperOption
extends Resource

export (PackedScene) var collectable
export var chances:float


func _init(collectable:PackedScene = null, chances = 100.0):
	self.collectable = collectable
	self.chances = chances
