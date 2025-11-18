extends Node2D

class_name BallEffect

var ball: EntityBall


func _ready() -> void:
	await owner.ready
	ball = owner as EntityBall
	assert(ball != null, "Must be child of EntityBall")
