extends Area2D

@onready var sprite = $AnimatedSprite2D

var opened = false

func _ready():
	sprite.play("idle")


func _on_body_entered(body):

	if not body.is_in_group("player"):
		return

	if opened:
		return

	if GameManager.has_key:

		opened = true
		body.set_physics_process(false)
		GameManager.timer_running = false
		sprite.play("open")
		$opensound.play()
		await sprite.animation_finished

		var win_screen = get_tree().current_scene.get_node("UI/CanvasLayer/Winscreen")

		if win_screen:
			body.visible = false

			await get_tree().create_timer(0.1).timeout
			win_screen.show_win()

	else:

		show_message()
func show_message():

	var msg = get_tree().current_scene.get_node("UI/CanvasLayer2/MessageLabel")

	if msg:

		msg.text = "Bạn cần tìm chìa khóa!"

		msg.show()

		await get_tree().create_timer(2.0).timeout

		msg.hide()
