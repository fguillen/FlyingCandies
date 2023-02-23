class_name LabelTypewriter
extends Label

export var key_delay_seconds := 0.1
export var auto_perform := false

onready var timer = Timer.new()

var text_to_display

signal key()


func _ready():
	text_to_display = get_text()
	set_text("")
	call_deferred("setup")



func setup():
	timer.one_shot = false
	timer.wait_time = key_delay_seconds
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)

	if auto_perform:
		perform()




func perform() -> void:
	timer.start()








func _on_timer_timeout():
	if len(text_to_display) > len(get_text()):
		var new_text = get_text() + text_to_display[len(get_text())]
		set_text(new_text)
		emit_signal("key")
	else:
		timer.queue_free()
