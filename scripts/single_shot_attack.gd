extends Node2D

var vel = Vector2()
var level = 1
var stats = {
	1: {
		'speed': 300, 
		'attack_range': 600, 
		'damage_amount': 1, 
		'attack_tick': 1
	},
	2:{
		'speed': 300, 
		'attack_range': 600, 
		'damage_amount': 1, 
		'attack_tick': 1,
	},
	3:{
		'speed': 300, 
		'attack_range': 600, 
		'damage_amount': 1, 
		'attack_tick': 1,
	},
}
	
var attack_tick_timer = 0
var bullet_scene = preload("res://scenes/single_shot_bullet.tscn")

onready var player = get_parent()
onready var current_level = player.get_parent()

func _ready():
	stats[level].attack_tick *= player.attack_rate

func _process(delta):
	attack_tick_timer += delta
	if attack_tick_timer > stats[level].attack_tick:
		attack_tick_timer = 0
		shoot()
		
func shoot():
	var all_enemies = get_tree().get_nodes_in_group("enemy")
	if all_enemies.size() > 0:
		var closest_enemy
		for enemy in all_enemies:
			if not closest_enemy:
				if player.position.distance_to(enemy.position) < stats[level].attack_range:
					closest_enemy = enemy
			elif player.position.distance_to(enemy.position) < player.position.distance_to(closest_enemy.position):
				closest_enemy = enemy
		if closest_enemy:
			var offset = deg2rad(0)
			for i in range(2*level-1):
				vel = player.position.direction_to(closest_enemy.position) * stats[level].speed
				vel = vel.rotated(offset)
				var bullet = bullet_scene.instance()
				bullet.position = player.position
				bullet.velocity = vel
				bullet.rotation_degrees = offset
				bullet.damage = stats[level].damage_amount
				current_level.add_child(bullet)
				if i % 2 != 0:
					offset = -offset
				else:
					offset = abs(offset) + deg2rad(20)
				
