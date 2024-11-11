extends Node3D

@export var falling: bool = false

func set_falling(f: bool) -> void:
	falling = f
	
	if falling:
		$Mover.move_direction = Vector3(0, -1, 0)
	else:
		$Mover.move_direction = Vector3(0, 0, 0)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_SPACE:
			set_falling(true)
