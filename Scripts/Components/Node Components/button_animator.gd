extends Node
class_name ButtonAnimatorComponent


## Component Depedencies.
@onready var button : Button = get_parent()

@export var default_scale : Vector2 = Vector2(1.0 , 1.0)
@export var focus_scale : Vector2 = Vector2(1.2 , 1.2)
@export var stack_rotation : float = 0.2

@export var allow_stack_rotation : bool


## Initial Setup.
func _ready() -> void:
	_setup()


## Component functions.
func _setup() -> void:
	button.focus_entered.connect(_focus_on)
	button.focus_exited.connect(_focus_off)
	
	button.mouse_entered.connect(_focus_on)
	button.mouse_exited.connect(_focus_off)
	
	button.pivot_offset_ratio = Vector2(0.5 , 0.5)


## Tween Animations.
func _focus_on() -> void:
	var tw = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK).set_parallel(true)
	
	tw.tween_property(button, "scale", focus_scale, 0.2)
	
	if allow_stack_rotation == true:
		tw.tween_property(button, "rotation", stack_rotation * [-1 , 1].pick_random(), 0.2)

func _focus_off() -> void:
	var tw = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BACK).set_parallel(true)
	
	tw.tween_property(button, "scale", default_scale, 0.2)
	tw.tween_property(button, "rotation", 0.0 , 0.2)
