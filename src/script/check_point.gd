extends Area2D

var activated = false

@onready var sprite = $AnimatedSprite2D


func _ready():

	sprite.play("idle")


func _on_body_entered(body):

	if activated:
		return
	
	if body.is_in_group("player"):

		activated = true

		body.respawn_position = global_position

		sprite.play("active")
		$CheckPointSound.play()
		var msg = get_tree().current_scene.get_node("UI/CanvasLayer2/MessageLabel")

		if msg:

			msg.text = "Đã mở điểm hồi sinh!"

			msg.modulate.a = 0
			msg.show()
		var tween = create_tween()
		tween.tween_property(msg, "modulate:a", 1.0, 0.2)

		await get_tree().create_timer(2.0).timeout

		msg.hide()
		print("Checkpoint Activated!")
