extends Node2D


func _ready():
	MusicManager.play_music(
		MusicManager.home_music)
	$btlvl2.disabled =!GameManager.unlocked_levels["Level2"]

	$btlvl3.disabled =!GameManager.unlocked_levels["Level3"]
	
	$btlvl4.disabled =!GameManager.unlocked_levels["Level4"]
	
	$btlvl5.disabled =!GameManager.unlocked_levels["Level5"]




func _on_btquit_pressed() -> void:
	MusicManager.play_click()
	get_tree().change_scene_to_file("res://stages/home.tscn")
	pass # Replace with function body.


func _on_btlvl_1_pressed() -> void:
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
	get_tree().change_scene_to_file(
		"res://stages/level1/world.tscn"
	)
	pass # Replace with function body.


func _on_btlvl_2_pressed() -> void:
	MusicManager.play_click()
	GameManager.current_level = "Level2"
	GameManager.lives = GameManager.max_lives
	GameManager.has_key = false
	GameManager.reset_timer()

	GameManager.timer_running = true
	GameManager.coins = 0

	GameManager.collected_coins.clear()

	GameManager.total_coins = GameManager.level_total_coins["Level2"]
	GameManager.lives = GameManager.max_lives
	get_tree().paused = false
	get_tree().change_scene_to_file(
		"res://stages/level2/world2.tscn"
	)
	pass # Replace with function body.
func _on_btlvl_3_pressed() -> void:
	MusicManager.play_click()
	GameManager.current_level = "Level3"
	GameManager.lives = GameManager.max_lives
	GameManager.has_key = false
	GameManager.reset_timer()

	GameManager.timer_running = true
	GameManager.coins = 0

	GameManager.collected_coins.clear()

	GameManager.total_coins = GameManager.level_total_coins["Level3"]
	GameManager.lives = GameManager.max_lives
	get_tree().paused = false
	get_tree().change_scene_to_file(
		"res://stages/level3/world4.tscn"
	)
	pass # Replace with function body.
func _on_btlvl_4_pressed() -> void:
	MusicManager.play_click()
	GameManager.current_level = "Level4"
	GameManager.lives = GameManager.max_lives
	GameManager.has_key = false
	GameManager.reset_timer()

	GameManager.timer_running = true
	GameManager.coins = 0

	GameManager.collected_coins.clear()

	GameManager.total_coins = GameManager.level_total_coins["Level4"]
	GameManager.lives = GameManager.max_lives
	get_tree().paused = false
	get_tree().change_scene_to_file(
		"res://stages/level4/world6.tscn"
	)
	pass # Replace with function body.
func _on_btlvl_5_pressed() -> void:
	MusicManager.play_click()
	GameManager.current_level = "Level5"
	GameManager.lives = GameManager.max_lives
	GameManager.has_key = false
	GameManager.reset_timer()

	GameManager.timer_running = true
	GameManager.coins = 0

	GameManager.collected_coins.clear()

	GameManager.total_coins = GameManager.level_total_coins["Level5"]
	GameManager.lives = GameManager.max_lives
	get_tree().paused = false
	get_tree().change_scene_to_file(
		"res://stages/level5/world8.tscn"
	)
	pass # Replace with function body.
