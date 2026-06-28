extends Node2D


func _ready():
	MusicManager.play_music(
		MusicManager.level_music
	)
	if GameManager.spawn_id != "":

		var spawn = get_node_or_null(GameManager.spawn_id)

		if spawn:

			$player.global_position = spawn.global_position
