extends Node2D

class_name GameController

@export var reserve_balls: int = 10
@export var level_goal: int = 10

var pegs_left: int = level_goal:
	get:
		return pegs_left
	set(value):
		if value != pegs_left:
			pegs_left = value

@export_group("Node Setup")
@export var ball_launcher: BallLauncher
@export var peg_container: PegContainer
@export var deletion_area: DeletionArea

var round_in_process: bool = false


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		if !round_in_process:
			ball_launcher.launch_ball()


func _ready() -> void:
	#set_level_goal()
	connect_signals()


func connect_signals():
	#peg_container.removed_orange.connect(get_remaining_pegs)
	ball_launcher.ball_launched.connect(start_round)
	deletion_area.deleted_ball.connect(end_round)

	#func get_remaining_pegs() -> void:
	#var count: int = 0
	#
	#for peg in peg_container.active_pegs:
	#if peg.state == EntityPeg.STATES.ORANGE:
	#count += 1
	#
	#pegs_left = count - 1


func start_round():
	reserve_balls -= 1
	print(reserve_balls)
	round_in_process = true


func end_round():
	round_in_process = false
	victory_or_lose()


func victory_or_lose():
	if reserve_balls <= 0 and pegs_left >= 1:
		get_tree().reload_current_scene()
	elif pegs_left <= 0:
		print("You win!")

	#func set_level_goal():
	#var available = peg_container.active_pegs
	#
	#available.shuffle()
	#
	#for i in range(min(level_goal, available.size())):
	#var peg = available[i]
	#
	#peg.change_state(EntityPeg.STATES.ORANGE)
