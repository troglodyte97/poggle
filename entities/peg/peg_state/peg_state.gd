extends State

class_name PegState

signal was_hit

@export var state_texture: Texture2D

const NORMAL = "Normal"
const ORANGE = "Orange"
const HIT = "Hit"

var peg: EntityPeg


func validate_collision(body: PhysicsBody2D):
	if body is EntityBall:
		was_hit.emit()


func _ready() -> void:
	await owner.ready
	peg = owner as EntityPeg
	peg.body_entered.connect(validate_collision)
	assert(peg != null, "Must be child of EntityPeg")
