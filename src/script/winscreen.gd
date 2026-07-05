extends Control


func _ready():
	
	hide()


func show_win():
	GameManager.game_finished = true
	GameManager.timer_running = false
	$WinSound.play()
	show()
	$RemainingTimeLabel.text = (
	"Thời gian còn lại: "
	+ GameManager.format_time(
		GameManager.level_time
	)
	)
	var current_time = GameManager.level_time

	var best_time = GameManager.best_times[
	GameManager.current_level
	]
	var new_record = false
	if best_time == 0 or current_time > best_time:

		GameManager.best_times[
			GameManager.current_level
		] = current_time
		GameManager.save_game()
		new_record = true
	if new_record:

		$NewRecordLabel.show()

	else:

		$NewRecordLabel.hide()
	$BestTimeLabel.text = "Kỷ lục cao nhất: "+ GameManager.format_time(
		GameManager.best_times[
			GameManager.current_level
		]
	)
	if GameManager.next_level_name.has(GameManager.current_level):
		var next_level = GameManager.next_level_name[
			GameManager.current_level
		]

		GameManager.unlocked_levels[
			next_level
		] = true

		GameManager.save_game()
	$Label.scale = Vector2.ZERO

	var tween = create_tween()

	tween.tween_property(
		$Label,
		"scale",
		Vector2.ONE,
		0.3
	)

	get_tree().paused = true


func _on_btreplay_pressed() -> void:
	MusicManager.play_click()
	get_tree().paused = false
	GameManager.restart_current_level()
	pass # Replace with function body.


func _on_btnext_pressed() -> void:
	MusicManager.play_click()
	get_tree().paused = false
	GameManager.load_next_level()
	pass # Replace with function body.


func _on_bthome_pressed() -> void:
	MusicManager.play_click()
	get_tree().paused = false
	GameManager.go_home()
	pass # Replace with function body.
