extends KinematicBody2D

onready var current_level = get_parent()
onready var player = current_level.get_node('player')

var vel = Vector2()
var speed = 50
var damage_amount = 1
var damage_tick = 1
var damage_tick_timer = 0
var touching_player = false

func _process(delta):
	vel = position.direction_to(player.position) * speed
	vel = move_and_slide(vel)
	
	if not touching_player:
		damage_tick_timer = 0
	else:
		damage_tick_timer += delta
		if damage_tick_timer >= damage_tick:
			damage_tick_timer = 0
			deal_damage(damage_amount)

func deal_damage(damage):
	player.modify_hp(-damage)
