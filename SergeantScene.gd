extends Node

const ENCOURAGING_WORDS = [
	"You're a fighter, soldier.",
	"Show them what you're made of.",
	"Remember your training and you'll come out on top.",
	"We're all counting on you, soldier. Don't let us down.",
	"You've got this. Trust in your abilities.",
	"The enemy doesn't stand a chance against you, soldier.",
	"Stay strong and focused, soldier. You can do this.",
	"Keep your head up and your eyes on the prize, soldier.",
	"Believe in yourself, soldier.",
	"Show them what the true meaning of bravery is, soldier.",
	"Never give up, soldier.",
	"We're with you every step of the way.",
	"You're a force to be reckoned with, soldier.",
	"Go get 'em.",
	"Your determination and grit are unmatched, soldier.",
	"It's time to show the world what you're made of, soldier.",
	"You're a true hero, soldier.",
	"We're honored to have you on our team.",
	"Stay focused and determined, soldier.",
	"The victory is within reach.",
	"This is your moment, soldier. Make it count.",
	"You're a born leader, soldier.",
	"Show the others how it's done.",
	"You've trained for this moment, soldier.",
	"Go out there and make it happen.",
	"Your courage and strength are an inspiration, soldier.",
	"The fate of our nation rests on your shoulders, soldier.",
	"We know you can handle it."
]

const SOLDIER_ANSWERS = [
	"You can count on me, sergeant.",
	"I won't let you down, sir.",
	"I'm ready for anything, sergeant.",
	"I'll give it my all, sir.",
	"You have my word, sergeant.",
	"I won't disappoint you, sir.",
	"You can trust me, sergeant.",
	"I'm with you all the way, sir.",
	"I won't falter, sergeant.",
	"I'm honored to serve under your command, sir."
]

onready var animation_player := $AnimationPlayer
onready var label_sargeant_encouraging := $Dialog/LabelSargentEncouraging
onready var label_pilot_yes_sir := $Dialog/LabelPilotYesSir

var random = RandomNumberGenerator.new()

func _init():
	random.randomize()


func _ready():
	animation_player.play("Play")

	label_sargeant_encouraging.text_to_display = ENCOURAGING_WORDS[random.randi_range(0, ENCOURAGING_WORDS.size() - 1)]
	label_pilot_yes_sir.text_to_display = SOLDIER_ANSWERS[random.randi_range(0, SOLDIER_ANSWERS.size() - 1)]
