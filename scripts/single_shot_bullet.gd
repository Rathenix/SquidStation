extends KinematicBody2D

var velocity
var damage

func _process(delta):
	var collision = move_and_collide(velocity)
	if collision:
		if collision.collider.is_in_group("enemy"):
			collision.collider.take_damage(damage)
		queue_free()
