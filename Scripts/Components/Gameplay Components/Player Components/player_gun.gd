extends Node
class_name PlayerGunComponent


## Component Depedencies.
@export var muzzle : Marker2D
@export var bullet : PackedScene

@export var lock_gun : bool


## Initial Setup.
func _process(_delta: float) -> void:
	if lock_gun == false:
		_get_input()


## Component Functions.
func _shoot() -> void:
	var bi = bullet.instantiate()
	
	bi.global_position = muzzle.global_position
	add_child(bi)

func _get_input() -> void:
	var board_animator = get_tree().get_first_node_in_group("Board Animator")
	
	if Input.is_action_just_pressed("ui_up"):
		_shoot()
		
		board_animator._bounce_board(Vector2(0.0 , 2.0))
