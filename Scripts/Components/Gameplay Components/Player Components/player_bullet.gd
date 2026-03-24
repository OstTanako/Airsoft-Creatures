extends Node
class_name PlayerBulletComponent


## Component Depedencies.
@export var bullet : CharacterBody2D
@export var eraser_area : Area2D
@export var eraser_cast : RayCast2D
@export var move_delay : Timer

@export var lock_bullet : bool
var tile_size = Vector2(32 , 32)


## Initial Setup.
func _process(_delta: float) -> void:
	if lock_bullet == false:
		_move_to_line(Vector2.UP)
	
	if eraser_cast.is_colliding():
		_erase_it_cast()


## Component Functions.
func _setup() -> void:
	eraser_area.body_entered.connect(_erase_it)

func _move_to_line(dir : Vector2) -> void:
	if move_delay.time_left == 0 or move_delay.is_stopped():
		bullet.global_position += dir * tile_size
		_check_move_delay()

func _check_move_delay() -> void:
	if move_delay.time_left == 0 or move_delay.is_stopped():
		move_delay.start()

func _erase_it(body : Node2D) -> void:
	if body.is_in_group("Intruder"):
		bullet.queue_free()

func _erase_it_cast() -> void:
	bullet.queue_free()
