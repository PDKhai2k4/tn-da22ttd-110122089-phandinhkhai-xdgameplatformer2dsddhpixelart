extends Node
var sfx_player : AudioStreamPlayer
var player : AudioStreamPlayer

@onready var home_music = preload(
	"res://sounds/Theme1.ogg"
)

@onready var level_music = preload(
	"res://sounds/Castle2.ogg"
)
@onready var click_sound = preload(
	"res://sounds/floraphonic-90s-game-ui-3-185096.mp3"
)

func _ready():

	player = AudioStreamPlayer.new()

	add_child(player)
	player.bus = "Music"
	sfx_player = AudioStreamPlayer.new()
	add_child(sfx_player)
	sfx_player.bus = "SFX"
func play_home_music():

	player.volume_db = 0

	play_music(home_music)

func play_click():

	sfx_player.stream = click_sound
	sfx_player.play()
func play_level_music():

	player.volume_db = -15
	play_music(level_music)
func play_music(music):

	if player.stream == music:
		return

	player.stream = music

	player.play()
