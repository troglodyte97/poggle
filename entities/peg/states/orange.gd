extends PegState

func enter(_previous_state_path: String, _data: Dictionary = { }) -> void:
	peg.main_sprite.texture = self.state_texture
	was_hit.connect(peg_was_hit)


func peg_was_hit() -> void:
	finished.emit(HIT)
