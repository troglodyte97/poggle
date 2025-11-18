extends PegState

func enter(previous_state_path: String, _data: Dictionary = { }) -> void:
	if previous_state_path == HIT:
		return

	peg.main_sprite.texture = self.state_texture
	match previous_state_path:
		NORMAL:
			var state_color: Color = Color(0.5, 0.817, 1.0, 1.0)
			peg.hit_light.color = state_color
			peg.particles.process_material.set_color(state_color)
			peg.main_sprite.get_material().set_shader_parameter("flash_color", state_color)
		ORANGE:
			var state_color: Color = Color(1.0, 0.7, 0.5, 1.0)
			peg.hit_light.color = state_color
			peg.particles.process_material.set_color(state_color)
			peg.main_sprite.get_material().set_shader_parameter("flash_color", state_color)

	peg.hit_sound.play_from_allowed()
	peg.animations.play("hit_effect")
	await peg.animations.animation_finished

	peg.main_sprite.set_material(null)
	peg.animations.play("fade_out")
	await peg.animations.animation_finished
	peg.queue_free()
