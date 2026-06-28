extends Area2D

@export var target_path: NodePath
@export var method_name := ""
var activated = false

@onready var sprite = $AnimatedSprite2D


func _ready():

	sprite.play("off")


func _on_body_entered(body):

	if activated:
		return

	if not body.is_in_group("player"):
		return

	activated = true

	sprite.play("on")
	$LeverSound.play()
	
	var msg = get_tree().current_scene.get_node("UI/CanvasLayer2/MessageLabel")

	if msg:
		msg.text = "Cơ quan đã mở!"
		msg.show()
		await get_tree().create_timer(2.0).timeout
		msg.hide()

	var target = get_node_or_null(target_path)

	if target and target.has_method(method_name):

		target.call(method_name)
