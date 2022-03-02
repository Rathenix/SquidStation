extends Node2D

onready var sfx_slider = $sfx_slider
onready var music_slider = $music_slider
onready var mute_checkbox = $mute_checkbox

func _ready():
	mute_checkbox.pressed = Game.Options.mute
	sfx_slider.value = Game.Options.sfx_volume
	music_slider.value = Game.Options.music_volume

func _on_back_button_pressed():
	Game.close_menu()
	get_tree().change_scene(Game.Screens.title_screen)

func _on_mute_checkbox_pressed():
	Game.Options.mute = mute_checkbox.pressed

func _on_sfx_slider_value_changed(value):
	Game.Options.sfx_volume = sfx_slider.value

func _on_music_slider_value_changed(value):
	Game.Options.music_volume = music_slider.value
