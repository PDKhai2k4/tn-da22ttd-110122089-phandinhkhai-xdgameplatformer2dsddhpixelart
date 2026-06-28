extends CharacterBody2D
@onready var collision = $CollisionShape2D
@onready var jump_sound = $JumpSound
const SPEED = 120.0
const JUMP_VELOCITY = -450.0
const DOUBLE_JUMP_VELOCITY = -300.0
# Double Jump
const MAX_JUMPS = 2

# Jump Feel
const COYOTE_TIME = 0.15
const JUMP_BUFFER_TIME = 0.15

# Movement Feel
const GROUND_ACCEL = 1200.0
const AIR_ACCEL = 100.0

# Faster Fall
const FALL_MULTIPLIER = 1.8

var jump_count = 0

var coyote_timer = 0.0
var jump_buffer_timer = 0.0

var is_dead = false

var respawn_position : Vector2
 
@onready var sprite = $Animation


func _physics_process(delta: float) -> void:

	# Đã chết
	if is_dead:

		velocity += get_gravity() * delta

		move_and_slide()

		return

	# Gravity + Faster Fall
	if not is_on_floor():

		velocity += get_gravity() * delta

		if velocity.y > 0:
			velocity += get_gravity() * (FALL_MULTIPLIER - 1.0) * delta

	# Coyote Time
	if is_on_floor():

		jump_count = 0

		coyote_timer = COYOTE_TIME

	else:

		coyote_timer -= delta

	# Jump Buffer
	if Input.is_action_just_pressed("ui_accept"):

		jump_buffer_timer = JUMP_BUFFER_TIME

	else:

		jump_buffer_timer -= delta

	# Jump Logic
	if jump_buffer_timer > 0:

		# Jump thường + Coyote Time
		if coyote_timer > 0:

			velocity.y = JUMP_VELOCITY
			jump_sound.stop()
			jump_sound.play()
			jump_count = 1
			

			jump_buffer_timer = 0

			coyote_timer = 0

		# Double Jump
		elif jump_count < MAX_JUMPS:

			velocity.y = DOUBLE_JUMP_VELOCITY
			jump_sound.stop()
			jump_sound.play()
			jump_count += 1

			jump_buffer_timer = 0

	# Variable Jump Height
	#if Input.is_action_just_released("ui_accept") and velocity.y < 0:

	#	velocity.y *= 0.5

	# Điều khiển trên không
	var accel = GROUND_ACCEL

	if not is_on_floor():
		accel = AIR_ACCEL

	# Di chuyển
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:

		velocity.x = move_toward(
			velocity.x,
			direction * SPEED,
			accel * delta
		)

		# Quay mặt
		sprite.flip_h = direction < 0

	else:

		velocity.x = move_toward(
			velocity.x,
			0,
			accel * delta
		)

	# Animation
	update_animation()

	move_and_slide()


func update_animation():

	if is_dead:
		return

	# Trên không
	if not is_on_floor():

		if velocity.y < 0:
			play_anim("jump")
		else:
			play_anim("fall")

	# Dưới đất
	else:

		if abs(velocity.x) < 5:
			play_anim("idle")
		else:
			play_anim("run")


func play_anim(anim_name):

	if sprite.animation != anim_name:
		sprite.play(anim_name)

func _ready():
	respawn_position = global_position

func die():

	if is_dead:
		return
	$DeathSound.play()
	GameManager.timer_running = false
	if GameManager.lives <= 0:
		return
	is_dead = true
	collision.set_deferred("disabled", true)
	# Hất lên
	velocity = Vector2(0, -280)

	# Chờ tới khi bắt đầu rơi
	while velocity.y < 0:
		await get_tree().process_frame

	# Bắt đầu nhấp nháy
	for i in range(5):

		sprite.visible = false
		await get_tree().create_timer(0.06).timeout

		sprite.visible = true
		await get_tree().create_timer(0.06).timeout
	GameManager.lives -= 1
	
	if GameManager.lives <= 0:

		GameManager.lives = 0
		await get_tree().create_timer(1.0).timeout
		var game_over = get_tree().current_scene.get_node_or_null(
			"UI/CanvasLayer/Gameoverscreen"
		)

		if game_over:
			game_over.show_game_over()

		return

	respawn()

func respawn():
	
	global_position = respawn_position

	velocity = Vector2.ZERO

	is_dead = false

	sprite.visible = true
	collision.set_deferred("disabled", false)
	GameManager.timer_running = true
func _on_button_pressed() -> void:
	pass
