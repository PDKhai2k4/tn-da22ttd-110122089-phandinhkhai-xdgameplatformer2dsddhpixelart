extends Control

func _ready():

	hide()

	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):

	if event.is_action_pressed("ui_cancel"):

		if get_tree().paused:

			resume_game()

		else:

			pause_game()


func _on_resume_button_pressed():
	MusicManager.play_click()
	hide()

	get_tree().paused = false
	GameManager.timer_running = true

func _on_restart_button_pressed() -> void:
	MusicManager.play_click()
	get_tree().paused = false

	GameManager.restart_current_level()
	pass # Replace with function body.


func _on_home_button_pressed() -> void:
	MusicManager.play_click()
	get_tree().paused = false

	GameManager.go_home()
	pass # Replace with function body.
func pause_game():
	
	show()
	GameManager.timer_running = false
	get_tree().paused = true


func resume_game():

	hide()

	get_tree().paused = false
