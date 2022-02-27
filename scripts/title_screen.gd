extends Node2D



func _on_start_button_pressed():
	get_tree().change_scene(Game.Screens.level1)

func _on_high_scores_button_pressed():
	get_tree().change_scene(Game.Screens.high_scores)

func _on_options_button_pressed():
	Game.open_menu()

func _on_quit_button_pressed():
	get_tree().quit()
