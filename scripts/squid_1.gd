extends KinematicBody2D

onready var current_level = get_parent()
onready var player = current_level.get_node('player')
onready var flash_timer = $flash_timer
onready var sprite = $AnimatedSprite

var vel = Vector2()
var speed = 50
var hp = 2
var damage_amount = 1
var damage_tick = 1
var damage_tick_timer = 0
var touching_player = false

func _ready():
	flash_timer.wait_time = 0.1

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

func take_damage(damage):
	flash(Color.red)
	hp -= damage
	if hp <= 0:
		queue_free()

func flash(color):
	sprite.material.set_shader_param("flash_color", color)
	sprite.material.set_shader_param("flash_modifier", 0.5)
	flash_timer.start()

func _on_flash_timer_timeout():
	sprite.material.set_shader_param("flash_modifier", 0.0)
