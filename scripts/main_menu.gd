extends Node2D

onready var backgroundParalax = $ParallaxBackground/ParallaxLayer
onready var main_controls = $main_controls
onready var options_controls = $options_controls
onready var sfx_slider = $options_controls/sfx_slider
onready var music_slider = $options_controls/music_slider
onready var mute_checkbox = $options_controls/mute_checkbox

func _ready():
	main_controls.visible = true
	options_controls.visible = false
	mute_checkbox.pressed = Game.Options.mute
	sfx_slider.value = Game.Options.sfx_volume
	music_slider.value = Game.Options.music_volume

func _process(delta):
	backgroundParalax.motion_offset.x -= delta * 10

func _on_start_button_pressed():
	get_tree().change_scene(Game.Screens.level1)

func _on_high_scores_button_pressed():
	get_tree().change_scene(Game.Screens.high_scores)

func _on_options_button_pressed():
	main_controls.visible = false
	options_controls.visible = true

func _on_quit_button_pressed():
	get_tree().quit()

func _on_back_button_pressed():
	main_controls.visible = true
	options_controls.visible = false

func _on_mute_checkbox_pressed():
	Game.Options.mute = mute_checkbox.pressed

func _on_sfx_slider_value_changed(value):
	Game.Options.sfx_volume = sfx_slider.value

func _on_music_slider_value_changed(value):
	Game.Options.music_volume = music_slider.value
