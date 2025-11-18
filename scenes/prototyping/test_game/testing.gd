extends Node2D

@export var ball_launcher: EntityLauncher
@export var camera: Camera2D

var balls: Array[EntityBall]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball_launcher.ball_launched.connect(start_round)


func start_round(ball: EntityBall) -> void:
	balls.append(ball)


func _physics_process(_delta: float) -> void:
	if balls.is_empty():
		return

	var average: Vector2 = Vector2.ZERO

	for ball: EntityBall in balls:
		average += ball.global_position

	average /= balls.size()

	camera.global_position = average
