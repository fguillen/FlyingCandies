extends Control


onready var animated_sprite:AnimatedSprite = $"%AnimatedSprite"


func wink() -> void:
	animated_sprite.play("Wink")
	animated_sprite.connect("animation_finished", self, "_on_wink_finished")


func _on_wink_finished() -> void:
	SceneSwitcher.load_menu()
