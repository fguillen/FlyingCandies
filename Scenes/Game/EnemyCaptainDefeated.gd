class_name EnemyCaptainDefeated
extends CanvasLayer

const ENEMY_DEFEATED = [
	"You are a brave warrior"
]

onready var animation_player := $AnimationPlayer

onready var label_enemy_defeated := $Dialog/LabelEnemyDefeated

var random = RandomNumberGenerator.new()


func _init():
	random.randomize()


func _ready():
	label_enemy_defeated.text_to_display = ENEMY_DEFEATED[random.randi_range(0, ENEMY_DEFEATED.size() - 1)]


func perform() -> void:
	print("EnemyCaptainDefeated.perform()")
	animation_player.play("Play")


func _on_AnimationPlayer_animation_finished(_anim_name:String):
	print("EnemyCaptainDefeated.animation_finished")
	Global.enemy_defeated()
