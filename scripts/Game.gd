extends Node

var Player = {
	"current_hp": 10,
	"max_hp": 10,
	"move_speed": 1,
	"attack_rate": 1,
	"attacks": [],
	"score": 0,
	"level_path": [],
}

var Screens = {
	"title_screen": "res://scenes/title_screen.tscn",
	"menu": "res://scenes/menu.tscn",
	"level1": "res://scenes/level1.tscn",
	"test_level": "res://scenes/infinite_level.tscn",
}

var Options = {
	"sfx_volume": 100,
	"music_volume": 100,
	"mute": false,
}

var menu_preload = preload("res://scenes/menu.tscn")
var menu
var Game_Timer = 10.0

func _ready():
	set_pause_mode(Node.PAUSE_MODE_PROCESS)

func _process(delta):
	if Input.is_action_just_pressed("ui_pause"):
		if get_tree().paused:
			Game.close_menu()
		else:
			Game.open_menu()

func open_menu():
	menu = menu_preload.instance()
	get_tree().get_current_scene().add_child(menu)
	get_tree().paused = true

func close_menu():
	menu.queue_free()
	get_tree().paused = false

func set_timer(current_game_time):
	Game_Timer = current_game_time

func game_over():
	pass
