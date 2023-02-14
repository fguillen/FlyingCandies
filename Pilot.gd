class_name Pilot

const MAX_FACES := 6
const MAX_EYES := 5
const MAX_NOSES := 5
const MAX_MOUTHS := 5
const MAX_HELMETS := 4
const MAX_BODIES := 5

export (int) var face := 0
export (int) var eyes := 0
export (int) var nose := 0
export (int) var mouth := 0
export (int) var helmet := 0
export (int) var body := 0
export (int) var name_index := 0

signal randomized()

var random = RandomNumberGenerator.new()
var name : String

const NAMES = [
	"Chuckleberry Finn",
	"Dingleberry Dingle",
	"Balthazoodle",
	"Zoltar Zest",
	"Tilly Toe-Tapper",
	"Poppycock Pimperne",
	"Giggleberry Gloop",
	"Fizz Fuzzton",
	"Ziggy Zapper",
	"Wally Wiggles",
	"Happy Haplinger",
	"Snicker Snackson",
	"Kooky Kooligan",
	"Jibber Jabberton",
	"Skipper Skipperhof",
	"Sassy Slingwell",
	"Hootie Hootenher",
	"Pogo Pogo-Sticker",
	"Fruity Fruttle",
	"Tood Twinkletoes",
	"Jazzy Jazzybum",
	"Spazzy Sparkspawn",
	"Zany Zapper",
	"Bouncy Bounceson",
	"Wacky Wackadoo",
	"Flippy Flopperson",
	"Glitzy Glitzspark",
	"Noodle Noodlespout",
	"Twirly Twirltastic",
	"Hoppy Hopscotch",
	"Dizzy Dazzler",
	"Scrappy Scrapple",
	"Yappy Yapster",
	"Grouchy Growler",
	"Nimble Nimbler",
	"Zesty Zestapotas",
	"Jumpy Jumpspout",
	"Skippy Skippernood",
	"Hissy Hissyfit",
	"Wriggly Wriggler"
]


func _init():
	random.randomize()


func randomize() -> void:
	face = random.randi_range(0, MAX_FACES - 1)
	eyes = random.randi_range(0, MAX_EYES - 1)
	nose = random.randi_range(0, MAX_NOSES - 1)
	mouth = random.randi_range(0, MAX_MOUTHS - 1)
	helmet = random.randi_range(0, MAX_HELMETS - 1)
	body = random.randi_range(0, MAX_BODIES - 1)

	name_index = random.randi_range(0, NAMES.size() - 1)
	name = NAMES[name_index]

	emit_signal("randomized")
