@icon("res://tools/troglodyte/icons/note_player.svg")
extends Node2D

class_name NotePlayer

@export_category("Main")
## This node works on the assumption that your sample is a C-note.
@export var sample: AudioStream

## Base volume before attenuation, in decibels.
@export_range(0, 2, 0.01)
var sample_db: float = 1.0:
	get():
		return sample_db
	set(value):
		if value != sample_db:
			sample_db = linear_to_db(value)

@export_category("Notes and Pitch")
## Octave of your sample, if applicable.
@export var base_octave: int = 4
## Restrict playback to select amount of notes.
@export var allowed_notes: Dictionary[NOTES, int]

@export_category("Voicing and Polyphony")
## Discards old players in favor of new ones if exceeding N.
@export_range(1, 16, 1.0)
var voices: int

var running_players: Array[AudioStreamPlayer2D]

enum NOTES {
	C,
	CS,
	D,
	DS,
	E,
	F,
	FS,
	G,
	GS,
	A,
	AS,
	B,
}


func convert_to_scale(note: NOTES, octave: int) -> float:
	var semitone_offset: float = note + ((octave - base_octave) * 12)
	return pow(2.0, semitone_offset / 12.0)


func play_from_allowed() -> void:
	if allowed_notes.is_empty():
		return

	var note: NOTES = allowed_notes.keys().pick_random()
	var octave: NOTES = allowed_notes[note] as NOTES

	play_sound(note, octave)


func create_audio_player() -> AudioStreamPlayer2D:
	var instance: AudioStreamPlayer2D = AudioStreamPlayer2D.new()
	instance.stream = sample
	self.add_child(instance)
	running_players.append(instance)
	return instance


func play_sound(note: NOTES, octave: int) -> void:
	var player: AudioStreamPlayer2D = create_audio_player()
	player.finished.connect(remove_audio_player.bind(player))
	player.pitch_scale = convert_to_scale(note, octave)
	player.volume_db = sample_db
	player.play()


func remove_audio_player(player: AudioStreamPlayer2D) -> void:
	if running_players.has(player):
		running_players.erase(player)

	player.queue_free()


func _on_timer_timeout() -> void:
	play_from_allowed()
