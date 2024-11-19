extends Node3D
class_name GridElement

@export var grid_position : Vector3i = Vector3i.ZERO
@export var size_on_grid : Vector3i = Vector3i.ONE
var updated = false

func reset_update():
	updated = false

func move(direction : Vector3i) -> bool:
	var old_position = position
	grid_position =  Grid.move_on_grid(grid_position,size_on_grid,self,direction)
	position =  Grid.get_grid().convert_to_world_coordinates(grid_position)
	return old_position != position
	
	
func move_time_steps(time_steps : int):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	grid_position = position
	Grid.reset_update.connect(reset_update)

				

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
