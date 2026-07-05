extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(
		MusicManager.home_music)
	pass # Replace with function body.

	


func _on_btsetting_pressed() -> void:
	MusicManager.play_click()
	$Setting.show()
	pass # Replace with function body.


func _on_b_thd_pressed() -> void:
	MusicManager.play_click()
	$TutorialPopup.show()
	pass # Replace with function body.
