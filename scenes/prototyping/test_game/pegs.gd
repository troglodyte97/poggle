extends Node2D

var goal_amount: int = 50

var pegs: Array[EntityPeg]


func _ready() -> void:
	set_peg_state()


func set_peg_state() -> void:
	var children: Array = self.get_children()

	children.shuffle()

	for i: int in range(min(goal_amount, children.size())):
		var peg: EntityPeg = children[i] as EntityPeg

		peg.state_machine.state.finished.emit(PegState.ORANGE)
