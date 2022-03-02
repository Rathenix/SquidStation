extends Area2D

var velocity
var damage

func _process(delta):
	position += velocity * delta

func _on_single_shot_bullet_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("enemy"):
		body.take_damage(damage)
	queue_free()
