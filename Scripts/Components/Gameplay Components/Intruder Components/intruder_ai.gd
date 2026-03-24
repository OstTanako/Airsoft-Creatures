extends Node
class_name IntruderAIComponent


## Component Depedencies.
@export var intruder : CharacterBody2D

@export var eraser_cast : RayCast2D
@export var limit_cast : RayCast2D

@export var move_delay : Timer
@export var invasion_delay : Timer

@export var lock_ai : bool

var tile_size = Vector2(32 , 32)


## Initial Setup.
func _process(_delta: float) -> void:
	if lock_ai == false:
		_move_to_line(Vector2.DOWN)
	
	if eraser_cast.is_colliding():
		erase_it()


## Component Functions.
func _move_to_line(dir : Vector2) -> void:
	if move_delay.time_left == 0 or move_delay.is_stopped():
		intruder.global_position += dir * tile_size
		_check_move_delay()

func _check_move_delay() -> void:
	if move_delay.time_left == 0 or move_delay.is_stopped():
		move_delay.start()

func erase_it() -> void:
	intruder.queue_free()
