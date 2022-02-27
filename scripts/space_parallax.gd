extends Node2D

onready var backgroundParalax = $ParallaxBackground/ParallaxLayer

func _process(delta):
	backgroundParalax.motion_offset.x -= delta * 10
