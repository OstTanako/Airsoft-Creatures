extends Marker2D
class_name IntruderSpawnerComponent


## Component Depedencies.
@export var intruder : PackedScene = preload("res://Scenes/Gameplay/Entities/intruder.tscn")
@export var freeze_spawner : bool

var spawn_delay = Timer.new()


## Initial Setup.
func _ready() -> void:
	_setup()

func _process(_delta: float) -> void:
	if freeze_spawner == false:
		_place_intruder()

## Component Functions.
func _setup() -> void:
	spawn_delay.wait_time = 3.0
	spawn_delay.one_shot = true
	
	add_child(spawn_delay)

func _place_intruder() -> void:
	if spawn_delay.time_left == 0 or spawn_delay.is_stopped():
		var i_is = intruder.instantiate()
		add_child(i_is)
		_check_spawn_delay()

func _check_spawn_delay() -> void:
	if spawn_delay.time_left == 0 or spawn_delay.is_stopped():
		spawn_delay.start()
