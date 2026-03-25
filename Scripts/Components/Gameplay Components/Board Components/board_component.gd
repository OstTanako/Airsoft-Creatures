extends Node
class_name BoardComponent


## Component Dependecies.
@export var board : Node2D
@export var limit_area : Area2D
@export var warning_area : Area2D
@export var limit_progress : ProgressBar

@export var board_animator : BoardAnimatorComponent

var invasion_delay = Timer.new()

## Initial Setup.
func _ready() -> void:
	_setup()

func _process(_delta: float) -> void:
	_update_progress()

## Component Functions.
func _limit_invaded(body : Node2D) -> void:
	if body.is_in_group("Intruder"):
		invasion_delay.start()
		
		#print("Intruder invaded the limit line so.. GAME OVER!")
		#get_tree().quit()

func _in_danger(body : Node2D):
	if body.is_in_group("Intruder"):
		#board_animator._scale_board(Vector2(1.7 , 1.7))
		pass

func _now_safe(body : Node2D) -> void:
	if body.is_in_group("Intruder"):
		#board_animator._scale_board(Vector2(1.0, 1.0))
		pass

func _update_progress() -> void:
	limit_progress.max_value = invasion_delay.wait_time
	limit_progress.value = invasion_delay.time_left

func _invasion_complete() -> void:
	get_tree().quit()

func _invasion_failed(body : Node2D) -> void:
	if body.is_in_group("Intruder"):
		invasion_delay.stop()

func _setup():
	limit_area.body_entered.connect(_limit_invaded)
	limit_area.body_exited.connect(_invasion_failed)
	
	warning_area.body_entered.connect(_in_danger)
	warning_area.body_exited.connect(_now_safe)
	
	invasion_delay.wait_time = 0.7
	invasion_delay.one_shot = true
	invasion_delay.timeout.connect(_invasion_complete)
	
	add_child(invasion_delay)
