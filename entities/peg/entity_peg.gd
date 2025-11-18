class_name EntityPeg
extends AnimatableBody2D

@export_group("Node Setup")
@export var state_machine: StateMachine
@export var hit_area: Area2D

@export_subgroup("Effects")
@export var animations: AnimationPlayer
@export var hit_light: PointLight2D
@export var particles: GPUParticles2D

@export_subgroup("Sounds")
@export var hit_sound: NotePlayer

@export_subgroup("Sprites")
@export var sprite_container: Node2D
@export var main_sprite: Sprite2D
