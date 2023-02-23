class_name EnemyCaptainSpeaking
extends CanvasLayer

const ENEMY_DISCOURAGING = [
	"Your efforts are futile. Human.",
	"Surrender or face destruction. Human.",
	"You are no match for us. Human.",
	"I suggest you turn back. Human",
	"Your arrogance will be your downfall.",
	"I have seen your future, and it is bleak.",
	"Your destruction is inevitable. Human.",
	"Your defeat is certain. Human.",
	"Your journey ends here. Human.",
	"Leave now or suffer the consequences.",
	"You will not survive this encounter."
]

const PILOT_ANSWERS = [
	"You're no match for me!",
	"I'll crush your fleet!",
	"I fear no aliens!",
	"This ends now, alien!",
	"I'll take you all down!",
	"My ship is unstoppable!",
	"I'll wipe you out!",
	"I am the ultimate warrior!",
	"I'll take on your whole armada!",
	"You're about to meet your doom!",
	"My courage knows no bounds!",
	"I am the scourge of the galaxy!"
]


const ENEMY_ANSWERS = [
	"Your fate is sealed.",
	"You've made a fatal mistake.",
	"You've sealed your own fate.",
	"You'll regret your arrogance.",
	"You'll pay for your actions.",
	"You've signed your death warrant.",
	"I warned you of the consequences.",
	"You've made a grave error.",
	"You'll suffer for your defiance.",
	"You've made a fatal miscalculation.",
	"You'll soon regret your decision.",
	"You've invited your own destruction.",
	"You'll be destroyed without mercy.",
	"You'll face the consequences.",
	"You'll meet your end here.",
	"You'll regret challenging us."
]

onready var animation_player := $AnimationPlayer

onready var label_enemy_discouraging := $Dialog/LabelEnemyDiscouraging
onready var label_pilot_answer := $Dialog/LabelPilotAnswer
onready var label_enemy_answer := $Dialog/LabelEnemyAnswer

onready var pilot_ui := $Dialog/PilotUI

var random = RandomNumberGenerator.new()


func _init():
	random.randomize()


func _ready():
	label_enemy_discouraging.text_to_display = ENEMY_DISCOURAGING[random.randi_range(0, ENEMY_DISCOURAGING.size() - 1)]
	label_pilot_answer.text_to_display = PILOT_ANSWERS[random.randi_range(0, PILOT_ANSWERS.size() - 1)]
	label_enemy_answer.text_to_display = ENEMY_ANSWERS[random.randi_range(0, ENEMY_ANSWERS.size() - 1)]

	pilot_ui.setup(Global.pilot)


func perform() -> void:
	print("EnemyCaptainSpeaking.perform()")
	animation_player.play("Play")
