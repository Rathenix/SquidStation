extends Label

onready var time_left = Game.Game_Timer

func _ready():
	set_text(str(int(time_left)))
	$Timer.start(time_left)

func _process(delta):
	set_text(str(int($Timer.time_left)))
	Game.set_timer($Timer.time_left)

func _on_Timer_timeout():
	Game.game_over()
