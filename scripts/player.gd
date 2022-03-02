extends Area2D

var current_hp = Game.Player.current_hp
var max_hp = Game.Player.max_hp
var move_speed = Game.Player.move_speed
var attack_rate = Game.Player.attack_rate
var attacks = Game.Player.attacks

var speed = 200 * move_speed
var vel = Vector2()

onready var sprite = $sprite
onready var hp_bar = $hp_bar
onready var flash_timer = $flash_timer

func _ready():
	hp_bar.max_value = max_hp
	hp_bar.value = current_hp
	flash_timer.wait_time = 0.1
	for attack in attacks:
		var atk = attack.attack.scene.instance()
		atk.level = attack.level
		add_child(atk)
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

func modify_hp(hp_amount):
	if hp_amount > 0:
		flash(Color.green)
	elif hp_amount < 0:
		flash(Color.red)
	current_hp = clamp(current_hp + hp_amount, 0, max_hp)
	hp_bar.value = current_hp
	
func flash(color):
	sprite.material.set_shader_param("flash_color", color)
	sprite.material.set_shader_param("flash_modifier", 0.5)
	flash_timer.start()

func _on_player_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("enemy"):
		body.touching_player = true

func _on_player_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body and body.is_in_group("enemy"):
		body.touching_player = false

func _on_flash_timer_timeout():
	sprite.material.set_shader_param("flash_modifier", 0.0)
