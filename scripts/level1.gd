extends Node2D

func _input(event):
	if event.is_action_pressed("ui_pause"):
		Game.open_menu()
