extends Node
class_name BoardComponent


## Component Dependecies.
@export var board : Node2D
@export var limit_area : Area2D
@export var warning_area : Area2D
@export var board_player : AnimationPlayer
@export var warning_icon : Sprite2D

@export var board_animator : BoardAnimatorComponent


## Initial Setup.
func _ready() -> void:
	_setup()

## Component Functions.
func _limit_invaded(body : Node2D) -> void:
	if body.is_in_group("Intruder"):
		print("Intruder invaded the limit line so.. GAME OVER!")
		get_tree().quit()

func _in_danger(body : Node2D):
	if body.is_in_group("Intruder"):
		#board_animator._scale_board(Vector2(1.7 , 1.7))
		pass

func _now_safe(body : Node2D) -> void:
	if body.is_in_group("Intruder"):
		#board_animator._scale_board(Vector2(1.0, 1.0))
		pass

func _setup():
	limit_area.body_entered.connect(_limit_invaded)
	
	warning_area.body_entered.connect(_in_danger)
	warning_area.body_exited.connect(_now_safe)
