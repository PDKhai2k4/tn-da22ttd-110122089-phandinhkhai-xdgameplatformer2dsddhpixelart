extends CharacterBody2D

const SPEED = 30.0

var direction = 1

@onready var sprite = $AnimatedSprite2D
@onready var raycast = $RayCast2D


func _ready():
	sprite.play("run")


func _physics_process(delta):

	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = direction * SPEED

	move_and_slide()

	if raycast.is_colliding():
		flip()

	play_anim("run")


func flip():

	direction *= -1

	sprite.flip_h = direction < 0

	raycast.target_position.x *= -1


func play_anim(anim_name):

	if sprite.animation != anim_name:
		sprite.play(anim_name)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):

		if body.is_dead:
			return

		body.die()
