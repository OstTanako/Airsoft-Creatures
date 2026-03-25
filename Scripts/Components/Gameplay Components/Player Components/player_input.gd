extends Node
class_name PlayerInputComponent


## Component Depedencies.
@export var player : CharacterBody2D
@export var collider_cast : RayCast2D

@export var input_locked : bool

var tile_size = Vector2(32 , 32)


## Initial Setup.
func _process(_delta: float) -> void:
	if input_locked == false:
		_get_input()


## Component Functions.
func _move_to(dir : Vector2) -> void:
	var board_animator = get_tree().get_first_node_in_group("Board Animator")
	var combined_move = dir * tile_size
	
	collider_cast.target_position = combined_move
	collider_cast.force_raycast_update()
	
	if ! collider_cast.is_colliding():
		player.global_position += combined_move
	else:
		if Input.is_action_just_pressed("Move Left"):
			board_animator._bounce_board(Vector2(-50.0 , 0.0))
		
		elif Input.is_action_just_pressed("Move Right"):
			board_animator._bounce_board(Vector2(50.0 , 0.0))

func _get_input() -> void:
	if Input.is_action_just_pressed("Move Left"):
		_move_to(Vector2.LEFT)
	
	if Input.is_action_just_pressed("Move Right"):
		_move_to(Vector2.RIGHT)
