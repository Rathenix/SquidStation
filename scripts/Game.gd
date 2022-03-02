extends Node

var attacks = {
	"single_shot": {
		"scene": preload("res://scenes/single_shot_attack.tscn"),
		"name": 'Single Shot',
	}
}

var Player = {
	"current_hp": 10,
	"max_hp": 10,
	"move_speed": 1,
	"attack_rate": 1,
	"attacks": [{'attack': attacks.single_shot, 'level': 1}],
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

var options_menu_preload = preload("res://scenes/options_menu.tscn")
var title_menu_preload = preload('res://scenes/title_menu.tscn')
var menu
var Game_Over = false
var Game_Timer = 10.0

func _ready():
	set_pause_mode(Node.PAUSE_MODE_PROCESS)

func _process(delta):
	if Input.is_action_just_pressed("ui_pause"):
		if get_tree().paused and not Game_Over:
			Game.close_menu()
		else:
			Game.open_menu()
			

func open_menu():
	menu = options_menu_preload.instance()
	if get_tree().get_current_scene().name == 'title_screen':
		var title_menu = get_tree().get_current_scene().get_node('main_menu')
		menu.position = title_menu.position
	else:
		var player = get_tree().get_current_scene().get_node('player')
		menu.position = player.position
	get_tree().get_current_scene().add_child(menu)
	get_tree().paused = true

func close_menu():
	menu.queue_free()
	get_tree().paused = false

func set_timer(current_game_time):
	Game_Timer = current_game_time

func game_over():
	Game_Over = true
	menu = title_menu_preload.instance()
	var player = get_tree().get_current_scene().get_node('player')
	menu.position = player.position
	get_tree().get_current_scene().add_child(menu)
	get_tree().paused = true

func game_restart():
	Game_Over = false
