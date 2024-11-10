extends Node
class_name GridMover

@onready var parent :Node3D = $".."

@export var move_direction : Vector3 = Vector3.ZERO

var move_tween : Tween

func _ready():
	TimeManager.time_tick.connect(move_time_steps)

func move_time_steps(time_steps : int):
	parent.position = parent.position + move_direction * time_steps
	
