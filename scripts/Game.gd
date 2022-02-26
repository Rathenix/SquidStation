extends Node

var Player = {
	"current_hp": 0,
	"max_hp": 0,
	"move_speed": 0,
	"attack_rate": 0,
	"attacks": [],
	"score": 0,
	"level_path": [],
}

var Screens = {
	"main_menu": "res://scenes/main_menu.tscn",
	"level1": "res://scenes/level1.tscn",
	"level2": "path/to/scene.tscn",
}

var Options = {
	"sfx_volume": 100,
	"music_volume": 100,
	"mute": false,
}
