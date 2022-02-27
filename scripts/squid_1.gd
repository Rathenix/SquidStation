extends KinematicBody2D

onready var current_level = get_parent()
onready var player = current_level.get_node('player')

var vel = Vector2()
var speed = 50

func _process(delta):
	vel = position.direction_to(player.position) * speed
	vel = move_and_slide(vel)
