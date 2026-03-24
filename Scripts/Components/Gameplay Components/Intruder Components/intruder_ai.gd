extends Node
class_name IntruderAIComponent


## Component Depedencies.
@export var intruder : CharacterBody2D

@export var eraser_area : Area2D

@export var move_delay : Timer
@export var invasion_delay : Timer

@export var lock_ai : bool

var tile_size = Vector2(32 , 32)


## Initial Setup.
func _process(_delta: float) -> void:
	if lock_ai == false:
		_move_to_line(Vector2.DOWN)

func _ready() -> void:
	_setup()


## Component Functions.
func _setup() -> void:
	eraser_area.body_entered.connect(_erase_it)

func _move_to_line(dir : Vector2) -> void:
	if move_delay.time_left == 0 or move_delay.is_stopped():
		intruder.global_position += dir * tile_size
		_check_move_delay()

func _check_move_delay() -> void:
	if move_delay.time_left == 0 or move_delay.is_stopped():
		move_delay.start()

func _erase_it(body : Node2D) -> void:
	if body.is_in_group("Player Bullet"):
		intruder.queue_free()
