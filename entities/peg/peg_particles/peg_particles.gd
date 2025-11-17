extends Node2D

class_name PegParticles

@export var color: Color

@onready var peg_hit: GPUParticles2D = $PegHit


func _ready() -> void:
	peg_hit.emitting = true


func _on_peg_hit_finished() -> void:
	self.queue_free()
