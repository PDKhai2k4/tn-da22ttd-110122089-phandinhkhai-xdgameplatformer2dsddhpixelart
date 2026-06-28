extends Control

func _ready():
	hide()

func show_game_over():
	GameManager.timer_running = false
	$GameoverSound.play()
	show()
	
	$Label.scale = Vector2.ZERO

	var tween = create_tween()

	tween.tween_property(
		$Label,
		"scale",
		Vector2.ONE,
		0.3
	)

	get_tree().paused = true


func _on_btretry_pressed() -> void:
	MusicManager.play_click()
	get_tree().paused = false
	GameManager.restart_current_level()
	
	pass # Replace with function body.


func _on_bthome_pressed() -> void:
	MusicManager.play_click()

	get_tree().paused = false
	GameManager.go_home()
	pass # Replace with function body.
