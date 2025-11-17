class_name Peg
extends RigidBody2D

@export_group("Node Setup")
@export var state_machine: StateMachine

@export_subgroup("Effects")
@export var animations: AnimationPlayer
@export var hit_light: PointLight2D
@export var particles: GPUParticles2D

@export_subgroup("Sounds")
@export var hit_sound: AudioStreamPlayer2D

@export_subgroup("Sprites")
@export var sprite_container: Node2D
@export var main_sprite: Sprite2D
