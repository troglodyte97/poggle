extends PegState

func enter(previous_state_path: String, data: Dictionary = { }) -> void:
	peg.main_sprite.texture = self.state_texture
	was_hit.connect(peg_was_hit)


func peg_was_hit():
	finished.emit(HIT)
