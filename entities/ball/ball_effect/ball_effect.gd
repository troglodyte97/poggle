extends Node2D

class_name BallEffect

@export_group("Trigger Settings")
## Does nothing if your extended class does not use the _trigger_effect function.
@export var retrigger: bool = false

var parent_ball: EntityBall


func _ready() -> void:
	initialize_effect()
	_ready_effect()


func _trigger_effect(_peg: EntityPeg):
	pass


func _physics_effect():
	pass


func _ready_effect():
	pass


func _physics_process(_delta: float) -> void:
	_physics_effect()


func initialize_effect():
	var parent = self.get_parent()

	if parent is EntityBall:
		parent_ball = parent
		parent_ball.triggered_peg.connect(retrigger_check)


func retrigger_check(peg: EntityPeg):
	if retrigger and peg.state == peg.STATES.HIT:
		_trigger_effect(peg)
	elif peg.state == peg.STATES.HIT:
		pass
	else:
		_trigger_effect(peg)
