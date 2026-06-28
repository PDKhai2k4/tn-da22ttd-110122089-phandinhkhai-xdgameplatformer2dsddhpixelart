extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(
		MusicManager.home_music)
	pass # Replace with function body.
