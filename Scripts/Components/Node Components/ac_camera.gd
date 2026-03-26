extends Camera2D
class_name ACCamera

var zoom_target = 1.0
var max_zoom = 2.0
var min_zoom = 1.0
var zoom_delay = 0.1


## Initial Setup.
func _physics_process(_delta: float) -> void:
	_get_zoom_input()


## Camera Functions.
func _change_zoom() -> void:
	var tw = create_tween().set_ease(Tween.EASE_OUT_IN).set_trans(Tween.TRANS_BACK)
	tw.tween_property(self, "zoom", Vector2(zoom_target, zoom_target), 0.1)

func _get_zoom_input() -> void:
	if Input.is_action_just_pressed("Add Zoom"):
		zoom_target = max(zoom_target - zoom_delay, min_zoom)
		_change_zoom()
	
	elif Input.is_action_just_pressed("Subtract Zoom"):
		zoom_target = min(zoom_target + zoom_delay, max_zoom)
		_change_zoom()
