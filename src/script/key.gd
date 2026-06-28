extends Area2D
@onready var sprite = $AnimatedSprite2D
@onready var sound = $PickupSound
func _ready():

	sprite.play("idle")
var collected = false
func _on_body_entered(body):

	if collected:
		return

	if not body.is_in_group("player"):
		return

	collected = true

	GameManager.has_key = true

	

	$PickupSound.play()

	hide()
	$CollisionShape2D.set_deferred("disabled", true)

	var msg = get_tree().current_scene.get_node(
		"UI/CanvasLayer2/MessageLabel"
	)

	msg.text = "Đã nhặt chìa khóa!"
	msg.show()

	await get_tree().create_timer(1.5).timeout

	msg.hide()

	queue_free()
