extends Node3D

@export var falling: bool = false
@export var move_direction : Vector3 = Vector3.ZERO


func set_falling(f: bool) -> void:
	falling = f
	
	if falling:
		move_direction = Vector3(0, -1, 0)
	else:
		move_direction = Vector3(0, 0, 0)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_SPACE:
			set_falling(true)
			


func move_time_steps(time_steps : int):
	position = position + move_direction * time_steps
	
