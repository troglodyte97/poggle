class_name BallLauncher
extends Node2D

signal ball_launched

@onready var launch_point: Marker2D = $LaunchPoint

@export var launch_force: float = 600.0
@export var rotation_speed: float = 0.1
@export var ball_scene: PackedScene

@export var effects: Array[PackedScene]


func _process(_delta: float) -> void:
	rotate_launcher()


func launch_ball():
	var instance = ball_scene.instantiate() as EntityBall

	instance.global_position = launch_point.global_position

	get_tree().root.add_child(instance)

	for s in effects:
		var effect_scene = s.instantiate()
		instance.add_child(effect_scene)

	var forward_dir = launch_point.global_transform.x.normalized()
	instance.apply_central_impulse(forward_dir * launch_force)
	ball_launched.emit()


func rotate_launcher():
	var mouse = get_global_mouse_position()

	var direction = mouse - self.global_position

	var angle = direction.angle()

	var curr_rotation = self.global_rotation

	self.global_rotation = lerp_angle(curr_rotation, angle, rotation_speed)
