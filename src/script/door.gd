extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var blocker = $StaticBody2D

var opened = false
var showing_message = false

func _ready():

	sprite.play("closed")


func _on_body_entered(body):

	if not body.is_in_group("player"):
		return

	if opened:
		return

	show_message()


func show_message():

	if showing_message:
		return

	showing_message = true

	var msg = get_tree().current_scene.get_node("UI/CanvasLayer2/MessageLabel")

	if msg:

		msg.text = "Bạn cần bật công tắt!"

		msg.modulate.a = 0
		msg.show()

		var tween = create_tween()
		tween.tween_property(msg, "modulate:a", 1.0, 0.2)

		await get_tree().create_timer(2.0).timeout

		msg.hide()

	showing_message = false


func open_door():

	if opened:
		return

	opened = true
	$OpenSound.play()
	$OpenSound2.play()
	sprite.play("open")
	
	await sprite.animation_finished

	blocker.queue_free()
