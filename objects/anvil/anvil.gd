extends GridElement
class_name Anvil

@export var falling: bool = false
@export var move_direction : Vector3 = Vector3.ZERO


func set_falling(f: bool) -> void:
	falling = f
	
	if falling:
		move_direction = Vector3(0, -1, 0)
		$Visual/Arrow.visible = true
		if is_instance_valid($Visual/Rope):
			$Visual/Rope.queue_free()
	else:
		move_direction = Vector3(0, 0, 0)
		$Visual/Arrow.visible = false
		
	update_label()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	set_falling(falling)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func move_time_steps(time_steps : int):
	move(move_direction * time_steps)
	
	update_label()
	
	
	
func update_label():
	$Visual/AboveGround.visible = falling
	
	if falling:
		
		var steps_above_ground = 0
		for i in range(1, 10):
			var object = Grid.get_grid().get_cell_content_world(global_position + Vector3(0, -i, 0))
			if (object is not GridElement) or (not is_instance_valid(object)) or (object == null):
				steps_above_ground += 1
			else:
				break
				
		$Visual/AboveGround.text = str(steps_above_ground) if steps_above_ground > 0 else "!!!"
		$Visual/AboveGround.modulate = Color.WHITE if steps_above_ground > 0 else Color.RED
		
