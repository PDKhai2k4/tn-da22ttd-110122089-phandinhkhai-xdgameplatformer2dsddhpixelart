extends Control

@onready var music_slider = $Panel/MusicSlider
@onready var sfx_slider = $Panel/SFXSlider

@onready var music_toggle = $Panel/MusicToggle
@onready var fullscreen_toggle = $Panel/FullscreenToggle

var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")


func _ready():

	music_slider.value = GameManager.settings["music_volume"]
	sfx_slider.value = GameManager.settings["sfx_volume"]

	music_toggle.button_pressed = !GameManager.settings["music_mute"]

	fullscreen_toggle.button_pressed = GameManager.settings["fullscreen"]


func _on_music_slider_value_changed(value):

	GameManager.settings["music_volume"] = value

	AudioServer.set_bus_volume_db(
		music_bus,
		value
	)

	GameManager.save_game()


func _on_sfx_slider_value_changed(value):

	GameManager.settings["sfx_volume"] = value

	AudioServer.set_bus_volume_db(
		sfx_bus,
		value
	)

	GameManager.save_game()


func _on_music_toggle_toggled(toggled):

	GameManager.settings["music_mute"] = !toggled

	AudioServer.set_bus_mute(
		music_bus,
		!toggled
	)

	GameManager.save_game()


func _on_fullscreen_toggle_toggled(toggled):

	GameManager.settings["fullscreen"] = toggled

	if toggled:

		DisplayServer.window_set_mode(
			DisplayServer.WINDOW_MODE_FULLSCREEN
		)

	else:

		DisplayServer.window_set_mode(
			DisplayServer.WINDOW_MODE_WINDOWED
		)

	GameManager.save_game()


func _on_close_pressed() -> void:
	MusicManager.play_click()
	hide()
	pass # Replace with function body.
