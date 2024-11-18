extends Node

var grid: GridObject

signal reset_update

func get_grid() -> GridObject:
	return grid;
	
func set_grid(_grid :GridObject):
	grid = _grid;
	
	
func move_on_grid(position : Vector3i, size : Vector3i,element : GridElement, direction : Vector3i) -> Vector3i:
	return grid.move_on_grid(position,size,element,direction)
	
