class_name EntityBall
extends RigidBody2D

@export var velocity_limit: float = 400.0

var gravity: float

signal triggered_peg(peg: EntityPeg)


func _ready() -> void:
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if state.linear_velocity.y >= velocity_limit:
		state.apply_central_force(Vector2(0, -state.linear_velocity.y))
