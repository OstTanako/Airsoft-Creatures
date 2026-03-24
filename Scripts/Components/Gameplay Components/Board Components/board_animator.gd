extends Node
class_name BoardAnimatorComponent


@export var board : Node2D


## Tween Animations.
func _rotate_board(rot : float) -> void:
	var tw = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tw.tween_property(board, "rotation_degrees", rot, 0.2)

func _bounce_board(pos : Vector2) -> void:
	var tw = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tw.tween_property(board, "position", pos, 0.2).as_relative()
	
	await  tw.finished
	
	_bounce_board_reset()

func _skew_board(sk : float) -> void:
	var tw = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tw.tween_property(board, "skew", sk, 0.2)

func _scale_board(scaly : Vector2) -> void:
	var tw = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tw.tween_property(board , "scale", scaly, 0.2)


## Reset Animations.
func _bounce_board_reset() -> void:
	var pin = get_tree().get_first_node_in_group("Board Pinner")
	
	var tw = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tw.tween_property(board, "position", pin.global_position, 0.2)
