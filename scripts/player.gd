extends Area2D

var speed = 200
var vel = Vector2()

onready var sprite = get_node("sprite")

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var input = Vector2(0, 0)
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	vel = input.normalized() * speed
	var pos = get_position() + vel * delta
	set_position(pos)
	if vel == Vector2(0, 0):
		sprite.set_animation("idle")
		sprite._set_playing(true) 
	elif vel.x > 0:
		sprite.set_animation("idle")
		sprite.set_frame(1)
		sprite.set_flip_h(false)
		sprite._set_playing(false)
	elif vel.x < 0:
		sprite.set_animation("idle")
		sprite.set_frame(1)
		sprite.set_flip_h(true)
		sprite._set_playing(false)
	elif vel.y != 0:
		sprite.set_animation("idle")
		sprite.set_frame(0)
		sprite._set_playing(false)
