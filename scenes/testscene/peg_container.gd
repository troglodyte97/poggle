extends Node2D

class_name PegContainer

signal removed_orange
var active_pegs: Array[EntityPeg]


func _ready() -> void:
	get_all_pegs()


func remove_peg(peg: EntityPeg):
	if active_pegs.has(peg):
		if peg.state == peg.STATES.ORANGE:
			removed_orange.emit()
		active_pegs.erase(peg)


func get_all_pegs():
	var children = self.get_children()

	for c in children:
		if c is EntityPeg:
			c.peg_hit.connect(remove_peg)
			active_pegs.append(c)
