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

var random = RandomNumberGenerator.new()
var name

var names = [
	"Chuckleberry Finn",
	"Dingleberry Dinglehoffer",
	"Balthazoodle",
	"Zoltar Zest",
	"Tilly Toe-Tapper",
	"Poppycock Pimpernel",
	"Giggleberry Gloop",
	"Fizz Fuzzton",
	"Ziggy Zapper",
	"Wally Wiggles",
	"Happy Haplinger",
	"Snicker Snackson",
	"Kooky Kooligan",
	"Jibber Jabberton",
	"Skipper Skipperhoffer",
	"Sassy Slingwell",
	"Hootie Hootenheimer",
	"Pogo Pogo-Stickerson",
	"Fruity Fruttle",
	"Toodleoo Twinkletoes",
	"Jazzy Jazzybum",
	"Spazzy Sparklespawn",
	"Zany Zapper",
	"Bouncy Bounceson",
	"Wacky Wackadoo",
	"Flippy Flopperson",
	"Glitzy Glitzspark",
	"Noodle Noodlespout",
	"Twirly Twirltastic",
	"Hoppy Hopscotch",
	"Dizzy Dazzler",
	"Scrappy Scrappletooth",
	"Yappy Yapster",
	"Grouchy Growler",
	"Nimble Nimbler",
	"Zesty Zestapotamus",
	"Jumpy Jumpspout",
	"Skippy Skippernoodle",
	"Hissy Hissyfit",
	"Wriggly Wriggler"
]


func _init():
	random.randomize()


func generate_random() -> void:
	face = random.randi_range(0, MAX_FACES - 1)
	eyes = random.randi_range(0, MAX_EYES - 1)
	nose = random.randi_range(0, MAX_NOSES - 1)
	mouth = random.randi_range(0, MAX_MOUTHS - 1)
	helmet = random.randi_range(0, MAX_HELMETS - 1)
	body = random.randi_range(0, MAX_BODIES - 1)

	name_index = random.randi_range(0, names.size())
	name = names[name_index]
