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
	get_tree().change_scene_to_file("res://stages/levels.tscn")
	pass # Replace with function body.
