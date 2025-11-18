class_name EntityLauncher
extends Node2D

signal ball_launched(ball: EntityBall)

@onready var launch_point: Marker2D = $LaunchPoint

@export var launch_force: float = 600.0
@export var rotation_speed: float = 0.1
@export var ball_scene: PackedScene


func _process(_delta: float) -> void:
	rotate_launcher()


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		launch_ball()


func launch_ball() -> void:
	var instance: EntityBall = ball_scene.instantiate() as EntityBall

	instance.global_position = launch_point.global_position

	owner.add_child(instance)

	var forward_dir: Vector2 = launch_point.global_transform.x.normalized()
	instance.apply_central_impulse(forward_dir * launch_force)
	ball_launched.emit(instance)


func rotate_launcher() -> void:
	var mouse: Vector2 = get_global_mouse_position()

	var direction: Vector2 = mouse - self.global_position

	var angle: float = direction.angle()

	var curr_rotation: float = self.global_rotation

	self.global_rotation = lerp_angle(curr_rotation, angle, rotation_speed)
