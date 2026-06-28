extends Area2D

@export_file("*.tscn") var next_level
@export var target_spawn = ""

var used = false

func _on_body_entered(body):

	if used:
		return

	if not body.is_in_group("player"):
		return

	used = true

	GameManager.spawn_id = target_spawn

	get_tree().call_deferred(
		"change_scene_to_file",
		next_level
	)
