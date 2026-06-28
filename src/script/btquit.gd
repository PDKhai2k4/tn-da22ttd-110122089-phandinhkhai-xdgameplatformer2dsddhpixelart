extends TextureButton


func _ready():
	button_down.connect(_on_down)
	button_up.connect(_on_up)

func _on_down():
	scale = Vector2(0.9, 0.9)
	modulate = Color(0.8, 0.8, 0.8)

func _on_up():
	scale = Vector2.ONE
	modulate = Color.WHITE

func _on_pressed() -> void:
	MusicManager.play_click()
	get_tree().quit()
	pass # Replace with function body.


func _on_btplay_pressed() -> void:
	MusicManager.play_click()
	GameManager.current_level = "Level1"
	GameManager.lives = GameManager.max_lives
	GameManager.has_key = false
	GameManager.reset_timer()

	GameManager.timer_running = true

	GameManager.coins = 0

	GameManager.collected_coins.clear()

	GameManager.total_coins = GameManager.level_total_coins["Level1"]
	GameManager.lives = GameManager.max_lives
	get_tree().paused = false
	get_tree().change_scene_to_file("res://stages/level1/world.tscn")
	pass # Replace with function body.
