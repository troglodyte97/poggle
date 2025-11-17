extends BallEffect

var ball_scene: PackedScene = preload("res://entities/ball/entity_ball.tscn")


func _trigger_effect(_peg: EntityPeg):
	var peg_position = _peg.global_position
	_peg.queue_free()

	var instance = ball_scene.instantiate() as RigidBody2D

	var angle = randf() * TAU
	var impulse = Vector2.RIGHT.rotated(angle)
	get_tree().root.add_child(instance)
	instance.global_position = peg_position
	instance.apply_central_impulse(impulse * 100)
