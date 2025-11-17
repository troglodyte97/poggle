extends BallEffect

class_name BlackHoleEffect

func _physics_effect():
	var mouse = get_global_mouse_position()

	var direction = mouse - parent_ball.global_position

	if Input.is_action_pressed("shoot"):
		parent_ball.apply_central_force(direction * 10)
