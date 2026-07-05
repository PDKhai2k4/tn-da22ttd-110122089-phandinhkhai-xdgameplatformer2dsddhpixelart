extends Node
var has_key = false
var spawn_id = ""
var game_finished = false
var max_lives = 3
var lives = 3

var current_level = ""
var coins = 0
var total_coins = 0
var collected_coins = {}
var level_total_coins = {
	"Level1": 10,
	"Level2": 10,
	"Level3": 20,
	"Level4": 20,
	"Level5": 20
}
var level_start_scene = {
	"Level1": "res://stages/level1/world.tscn",
	"Level2": "res://stages/level2/world2.tscn",
	"Level3": "res://stages/level3/world4.tscn",
	"Level4": "res://stages/level4/world6.tscn",
	"Level5": "res://stages/level5/world8.tscn"
}
func _ready():

	load_game()

	var music_bus = AudioServer.get_bus_index("Music")
	var sfx_bus = AudioServer.get_bus_index("SFX")

	AudioServer.set_bus_volume_db(
		music_bus,
		settings["music_volume"]
	)

	AudioServer.set_bus_volume_db(
		sfx_bus,
		settings["sfx_volume"]
	)

	AudioServer.set_bus_mute(
		music_bus,
		settings["music_mute"]
	)

	if settings["fullscreen"]:

		DisplayServer.window_set_mode(
			DisplayServer.WINDOW_MODE_FULLSCREEN
		)

	else:

		DisplayServer.window_set_mode(
			DisplayServer.WINDOW_MODE_WINDOWED
		)

func reset_level_data():
	game_finished = false
	coins = 0
	collected_coins.clear()
	lives = max_lives
	spawn_id = ""
	reset_timer()
	has_key = false
	timer_running = true

func restart_current_level():
	
	reset_level_data()
	spawn_id = ""
	get_tree().change_scene_to_file(
		level_start_scene[current_level]
	)

func go_home():
	
	reset_level_data()
	game_finished = false
	has_key = false
	get_tree().change_scene_to_file(
		"res://stages/home.tscn"
	)
var next_level_scene = {
	"Level2": "res://stages/level2/world2.tscn",
	"Level3": "res://stages/level3/world4.tscn",
	"Level4": "res://stages/level4/world6.tscn",
	"Level5": "res://stages/level5/world8.tscn"
}
func load_next_level():
	
	if current_level == "Level1":

		current_level = "Level2"
		total_coins = level_total_coins["Level2"]

	elif current_level == "Level2":

		current_level = "Level3"
		total_coins = level_total_coins["Level3"]

	elif current_level == "Level3":

		current_level = "Level4"
		total_coins = level_total_coins["Level4"]

	elif current_level == "Level4":

		current_level = "Level5"
		total_coins = level_total_coins["Level5"]

	reset_level_data()

	get_tree().change_scene_to_file(
		level_start_scene[current_level]
	)
var level_time = 0.0

var level_time_limit = {
	"Level1": 60.0, # 
	"Level2": 180.0, # 
	"Level3": 210.0, # 
	"Level4": 240.0, # 
	"Level5": 270.0  # 
}
var best_times = {
	"Level1": 0.0,
	"Level2": 0.0,
	"Level3": 0.0,
	"Level4": 0.0,
	"Level5": 0.0
}
var unlocked_levels = {
	"Level1": true,
	"Level2": false,
	"Level3": false,
	"Level4": false,
	"Level5": false
}
var timer_running = false
func reset_timer():

	level_time = level_time_limit[current_level]
		
func _process(delta):
	if get_tree().paused:
		return
	if not timer_running:
		return

	level_time -= delta

	if level_time <= 0:

		level_time = 0

		timer_running = false

		time_up()
func time_up():
	
	timer_running = false

	var player = get_tree().get_first_node_in_group("player")

	if player:

		player.set_physics_process(false)

	var game_over = get_tree().current_scene.get_node_or_null(
		"UI/CanvasLayer/Gameoverscreen"
	)

	if game_over:

		game_over.show_game_over()
func format_time(seconds):

	var total_seconds = int(seconds)

	var mins = floori(total_seconds / 60.0)

	var secs = total_seconds % 60

	return "%02d:%02d" % [mins, secs]
const SAVE_PATH = "user://save.dat"
func save_game():

	var data = {

		"best_times": best_times,

		"unlocked_levels": unlocked_levels,
		"settings": settings
	}

	var file = FileAccess.open(
		SAVE_PATH,
		FileAccess.WRITE
	)

	file.store_var(data)
func load_game():

	if not FileAccess.file_exists(SAVE_PATH):
		return

	var file = FileAccess.open(
		SAVE_PATH,
		FileAccess.READ
	)

	var data = file.get_var()

	if data.has("best_times"):
		best_times.merge(data["best_times"], true)

	if data.has("unlocked_levels"):
		unlocked_levels.merge(data["unlocked_levels"], true)
	if data.has("settings"):
		settings = data["settings"]

	
var next_level_name = {
	"Level1": "Level2",
	"Level2": "Level3",
	"Level3": "Level4",
	"Level4": "Level5"
}
var settings = {
	"music_volume": -5.0,
	"sfx_volume": 0.0,
	"music_mute": false,
	"fullscreen": false
}
