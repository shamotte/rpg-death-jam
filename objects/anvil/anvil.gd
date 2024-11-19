extends GridElement
class_name Anvil

@export var falling: bool = false
@export var move_direction : Vector3 = Vector3.ZERO


func set_falling(f: bool) -> void:
	falling = f
	
	if falling:
		move_direction = Vector3(0, -1, 0)
		$Visual/Arrow.visible = true
		$Visual/Rope.queue_free()
	else:
		move_direction = Vector3(0, 0, 0)
		$Visual/Arrow.visible = false
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	set_falling(falling)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func move_time_steps(time_steps : int):
	move(move_direction * time_steps)
	
	
