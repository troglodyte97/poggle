extends BallEffect

class_name GravityEffect

@export var gravity_scale: float = 1.0


func _ready_effect():
	parent_ball.gravity_scale = gravity_scale
