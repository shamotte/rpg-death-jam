extends Node
class_name GridMover

@onready var parent :Node3D = $".."

@export var move_direction : Vector3 = Vector3.ZERO

var move_tween : Tween

func _ready():
	TimeManager.time_tick.connect(move_time_steps)

func move_time_steps(time_steps : int):
	if move_tween:
		move_tween.kill()
		
	move_tween = get_tree().create_tween()
	move_tween.tween_property(parent,"position",parent.position + move_direction * time_steps,0.5)
	move_tween.set_trans(Tween.TRANS_QUINT)
	move_tween.set_ease(Tween.EASE_OUT_IN)
	
	
	
