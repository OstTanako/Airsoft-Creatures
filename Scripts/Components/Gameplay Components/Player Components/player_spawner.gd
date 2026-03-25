extends Marker2D
class_name PlayerSpawnerComponent


## Component Depedencies.
@export var player : PackedScene = preload("res://Scenes/Gameplay/Entities/player.tscn")


## Component Functions.
func _place_player() -> void:
	var p_is = player.instantiate()
	add_child(p_is)
