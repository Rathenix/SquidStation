extends Node2D

var vel = Vector2()
var speed = 10
var attack_range = 600
var damage_amount = 1
var attack_tick = 1
var attack_tick_timer = 0
var bullet_scene = preload("res://scenes/single_shot_bullet.tscn")

onready var player = get_parent()
onready var current_level = player.get_parent()

func _ready():
	attack_tick *= player.attack_rate

func _process(delta):
	attack_tick_timer += delta
	if attack_tick_timer > attack_tick:
		attack_tick_timer = 0
		shoot()
		
func shoot():
	var all_enemies = get_tree().get_nodes_in_group("enemy")
	if all_enemies.size() > 0:
		var closest_enemy
		for enemy in all_enemies:
			if not closest_enemy:
				if player.position.distance_to(enemy.position) < attack_range:
					closest_enemy = enemy
			elif player.position.distance_to(enemy.position) < player.position.distance_to(closest_enemy.position):
				closest_enemy = enemy
		if closest_enemy:
			vel = player.position.direction_to(closest_enemy.position) * speed
			var bullet = bullet_scene.instance()
			bullet.position = player.position
			bullet.velocity = vel
			bullet.damage = damage_amount
			current_level.add_child(bullet)
	
