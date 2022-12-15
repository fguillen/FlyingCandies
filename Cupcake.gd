extends KinematicBody2D
class_name Player

onready var labelVelocity = $LabelVelocity as Label
onready var labelState = $LabelState as Label
onready var labelJumpBuffer = $LabelJumpBuffer as Label
onready var labelCoyoteTime = $LabelCoyoteTime as Label

onready var animation_player: = $AnimationPlayer
onready var timer_jump_buffer: = $TimerJumpBuffer
onready var timer_coyote_time: = $TimerCoyoteTime
onready var sprite: = $Sprite

# No implemented
# onready var ladderSensor = $LadderSensor as RayCast2D


export(int) var JUMP_FORCE = 500
export(int) var JUMP_RELEASE_FORCE = 300
export(int) var FALL_EXTRA_GRAVITY = 100
export(int) var GRAVITY = 20
export(int) var FRICTION_DELTA = 100
export(int) var ACCELERATION_DELTA = 100
export(int) var MAX_SPEED = 200
export(int) var MAX_FALL_VELOCITY = 400
export(int) var CLIMB_SPEED = 100
export(int) var MAX_JUMPS = 2
export(float) var JUMP_BUFFER_SECONDS = 0.2
export(float) var COYOTE_TIME_SECONDS = 0.1


var velocity = Vector2.ZERO
enum State { IDLE, MOVE, CLIMB, JUMP }
var state = State.IDLE
var jumps_left = MAX_JUMPS
var jump_buffer_activated = false
var coyote_time_activated = false


func _ready():
	pass # Replace with function body.


func _process(_delta):
	labelVelocity.text = "%0.0f" % velocity.x
	labelState.text = State.keys()[state]
	labelJumpBuffer.text = "yes" if jump_buffer_activated else "no"
	labelCoyoteTime.text = "yes" if coyote_time_activated else "no"


func _physics_process(_delta):
	# Get Movement
	var movement = get_input_movement()

	# Flip character towards direction
	character_looks_direction(movement)

	match(state):
		State.IDLE: process_state_idle(movement)
		State.MOVE: process_state_move(movement)
		State.CLIMB: process_state_climb(movement)
		State.JUMP: process_state_jump(movement)


func jump():
	velocity.y = -JUMP_FORCE
	set_state(State.JUMP)
	jumps_left -= 1
	jump_buffer_activated = false
	coyote_time_activated = false


func apply_gravity():
	velocity.y += GRAVITY
	if velocity.y > 0:
		velocity.y += FALL_EXTRA_GRAVITY

	velocity.y = min(velocity.y, MAX_FALL_VELOCITY)


func apply_friction(movement):
	if movement.x != 0: return
	velocity.x = move_toward(velocity.x, 0, FRICTION_DELTA)


func apply_acceleration(movement):
	if movement.x == 0: return
	velocity.x = move_toward(velocity.x, MAX_SPEED * movement.x, ACCELERATION_DELTA)


func just_landed():
	animation_player.play("Landed")
	jumps_left = MAX_JUMPS

	if jump_buffer_activated:
		jump()


func can_jump():
	return jumps_left > 0 and (is_on_floor() or jumps_left > 0)


func get_input_movement():
	return Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)


func character_looks_direction(movement):
	if movement.x > 0:
		sprite.flip_h = true
	elif movement.x < 0:
		sprite.flip_h = false
	# we don't change if movment.x == 0



func process_state_idle(movement):
	# Animation
	if animation_player.current_animation != "Landed":
		animation_player.play("Idle")

	# Apply Physics
	apply_friction(movement)

	# Move
	velocity = move_and_slide(velocity, Vector2.UP)

	# Change state?
	if is_on_ladder() and Input.is_action_pressed("ui_up"):
		set_state(State.CLIMB)
		return

	if can_jump() and Input.is_action_just_pressed("ui_up"):
		jump()
		return

	if movement.length() > 0:
		set_state(State.MOVE)
		return

	if not is_on_floor():
		set_state(State.JUMP)
		return


func process_state_move(movement):
	# Animation
	if animation_player.current_animation != "Landed":
		animation_player.play("Run")

	# Apply Physics
	apply_gravity()
	apply_friction(movement)
	apply_acceleration(movement)

	# Move and check if just left ledge
	var was_on_floor = is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)

	if was_on_floor and not is_on_floor() and velocity.y > 0:
		coyote_time_activated = true
		timer_coyote_time.start(COYOTE_TIME_SECONDS)

	# Change state?
	if is_on_ladder() and Input.is_action_pressed("ui_up"):
		set_state(State.CLIMB)
		return

	if not is_on_floor():
		set_state(State.JUMP)
		return

	if (can_jump() or coyote_time_activated) and Input.is_action_just_pressed("ui_up"):
		jump()
		return

	if movement.x == 0:
		set_state(State.IDLE)
		return


func process_state_climb(movement):
	# Animations
	if movement.length() == 0:
		animation_player.play("Idle")
	else:
		animation_player.play("Run")
	pass

	# Apply Physics
	apply_friction(movement)
	apply_acceleration(movement)

	# Climb
	velocity.y = movement.y * CLIMB_SPEED

	# Move
	velocity = move_and_slide(velocity, Vector2.UP)

	# Change state?
	if not is_on_ladder():
		set_state(State.MOVE)
		return


func process_state_jump(movement):
	# Animation
	if animation_player.current_animation != "Jump" and animation_player.current_animation != "":
		animation_player.play("Jump")

	# Apply Physics
	apply_gravity()
	apply_friction(movement)
	apply_acceleration(movement)

	if Input.is_action_just_released("ui_up") and velocity.y < -JUMP_RELEASE_FORCE:
		velocity.y = -JUMP_RELEASE_FORCE

	# Store jump buffer
	if not can_jump() and not jump_buffer_activated and Input.is_action_just_pressed("ui_up"):
		jump_buffer_activated = true
		timer_jump_buffer.start(JUMP_BUFFER_SECONDS)

	# Move and check if just landed
	var was_on_floor = is_on_floor()
	velocity = move_and_slide(velocity, Vector2.UP)

	if not was_on_floor and is_on_floor():
		just_landed()
		return

	# Change state?
	if is_on_ladder() and Input.is_action_pressed("ui_up"):
		set_state(State.CLIMB)
		return

	if can_jump() and Input.is_action_just_pressed("ui_up"):
		jump()
		return

	if is_on_floor():
		set_state(State.IDLE)
		return


func is_on_ladder():
	return false
	# No implemented
	# return ladderSensor.is_colliding() and ladderSensor.get_collider() is Ladder


func set_state(value: int) -> void:
	print("set_state: ", State.keys()[value])
	state = value


func _on_JumpBufferTimer_timeout():
	jump_buffer_activated = false


func _on_CoyoteTimeTimer_timeout():
	coyote_time_activated = false
