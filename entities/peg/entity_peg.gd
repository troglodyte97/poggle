class_name EntityPegORIGINAL
extends RigidBody2D

@export var main_sprite: Sprite2D
@export var peg_sprites: Array[Texture2D]

@export var animations: AnimationPlayer

enum STATES { DEFAULT, ORANGE, HIT }
var state: STATES = STATES.DEFAULT

signal peg_hit(peg: EntityPeg)


func _ready() -> void:
	body_entered.connect(validate_collision)


func change_state(new_state: STATES):
	match new_state:
		STATES.DEFAULT:
			main_sprite.texture = peg_sprites[0]
			state = STATES.DEFAULT
		STATES.ORANGE:
			main_sprite.texture = peg_sprites[1]
			state = STATES.ORANGE
		STATES.HIT:
			main_sprite.texture = peg_sprites[2]
			state = STATES.HIT
			animations.play("hit_flash")
			await get_tree().create_timer(1).timeout
			queue_free()


func validate_collision(collided_with: PhysicsBody2D):
	if collided_with is EntityBall:
		var ball = collided_with

		if state != STATES.HIT:
			ball.triggered_peg.emit(self)
			peg_hit.emit(self)
			change_state(STATES.HIT)

		elif state == STATES.HIT:
			ball.triggered_peg.emit(self)
