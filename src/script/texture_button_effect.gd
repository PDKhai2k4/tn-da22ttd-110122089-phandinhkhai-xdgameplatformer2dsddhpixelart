extends TextureButton

var original_scale : Vector2

func _ready():
	original_scale = scale

	button_down.connect(_on_down)
	button_up.connect(_on_up)

func _on_down():
	scale = original_scale * 0.95
	self_modulate = Color(0.8, 0.8, 0.8)

func _on_up():
	scale = original_scale
	self_modulate = Color.WHITE
