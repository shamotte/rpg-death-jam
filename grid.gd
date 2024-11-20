extends Node3D
class_name GridObject




var world : Array #indexed as [x][y][z]

#region world size wariables
var min_x : int = 0
var min_y : int = 0
var min_z : int = 0
var world_size_x = 0
var world_size_z = 0
var world_size_y = 0

var world_margin = 10
#endregion


func _ready():
	Grid.set_grid(self)
	
	#region gthering world size (in other world monstrocity)
	
	 
	update_extents_req(self)
	
	
	min_x = abs(min_x - world_margin)
	min_y = abs(min_y - world_margin)
	min_z = abs(min_z - world_margin)
	
	world_size_x += min_x + world_margin + 1
	world_size_y += min_y + world_margin + 1
	world_size_z += min_z + world_margin + 1
	
	
	
	
	
	print(str(world_size_x)+ "   "+ str(world_size_y) + "    " + str(world_size_z))
	print(str(min_x) + "   " + str(min_y) + "   " + str(min_z))
	#endregion
	
	#region initializing world
	world = Array()
	world.resize(world_size_x)
	for it_x in range(world_size_x):
		world[it_x] = Array()
		world[it_x].resize(world_size_y)
		for it_y in range(world_size_y):
			world[it_x][it_y] = Array()
			world[it_x][it_y].resize(world_size_z);
			for it_z in range(world_size_z):
				world[it_x][it_y][it_z] = null


	
	
	add_children_to_grid_req(self)
	#endregion

	TimeManager.time_tick.connect(tick_on_grid)
	DeathManager.reset_counter()
	


	

func update_extents_req(node : Node3D):
	if node.is_in_group("grid_container"):
		if node.position != Vector3.ZERO:
			printerr(node.name + "nie jest ustawiony w punkcie (0,0,0) - prawdopodobnie niepoprawnie ustawienie siatki")
		for child : Node3D in node.get_children():
			update_extents_req(child)
	elif node.is_in_group("grid_element"):
		var child_position = node.position;
		min_x = min(child_position.x, min_x)
		min_y = min(child_position.y, min_y)
		min_z = min(child_position.z, min_z)
		world_size_x = max(world_size_x,child_position.x)
		world_size_y = max(world_size_y,child_position.y)
		world_size_z = max(world_size_z,child_position.z)
	
func add_children_to_grid_req(node : Node3D):
	print(node.name)
		
	if node.is_in_group("grid_container"):
		for child : Node3D in node.get_children():
			
			add_children_to_grid_req(child)
	elif node.is_in_group("grid_element"):
		var elem = node as GridElement
		for size_x in range(elem.size_on_grid.x):
			for size_y in range(elem.size_on_grid.y):
				for size_z in range(elem.size_on_grid.z):
		
					var grid_position : Vector3i = Vector3i(node.position) + Vector3i(size_x,size_y,size_z)
					world[grid_position.x + min_x][grid_position.y+ min_y][grid_position.z + min_z] = node;
				


func tick_on_grid(time_steps : int):
	
	for it_x in range(world_size_x):
		for it_y in range(world_size_y):
			for it_z in range(world_size_z):
				if is_instance_valid(world[it_x][it_y][it_z]):
					var element:GridElement = world[it_x][it_y][it_z]
					if is_instance_valid(element):
						if not element.updated:
							element.move_time_steps(time_steps)
							element.updated = true;
				else:
					world[it_x][it_y][it_z] = null
	Grid.reset_update.emit()


func deterministic_call_by_name(function_name : String, argv : Array):
	for it_x in range(world_size_x):
		for it_y in range(world_size_y):
			for it_z in range(world_size_z):
				var element:GridElement = world[it_x][it_y][it_z]
				if is_instance_valid(element):
					if element.has_method(function_name):
						element.callv(function_name,argv)

func get_cell_content_grid(position : Vector3i):
	if (position.x >= world_size_x || position.x  < 0):
		return null;
	if (position.y >= world_size_y || position.y  < 0):
		return null;
	if (position.z >= world_size_z || position.z < 0):
		return null;
	
	if is_instance_valid(world[position.x ][position.y ][position.z ]):
		return world[position.x ][position.y][position.z]
	else :
		return null


func get_cell_content_world(position : Vector3i):
	if (position.x + min_x >= world_size_x || position.x  +min_x< 0):
		return null;
	if (position.y + min_y >= world_size_y || position.y  + min_y< 0):
		return null;
	if (position.z + min_z >= world_size_z || position.z + min_z< 0):
		return null;
	
	if is_instance_valid(world[position.x + min_x][position.y + min_y][position.z + min_z]):
		return world[position.x + min_x][position.y + min_y][position.z + min_z]
	else :
		return null
	
func set_cell_context_world(position : Vector3i, element: GridElement)-> bool:
	if (position.x + min_x >= world_size_x || position.x + min_x < 0):
		return false;
	if (position.y + min_y >= world_size_y || position.y + min_y < 0):
		return false;
	if (position.z  + min_z >= world_size_z || position.z + min_z < 0):
		return false;
	
	world[position.x + min_x][position.y + min_y][position.z + min_z] = element
	return true
	
func set_cell_context_grid(position : Vector3i, element: GridElement)-> bool:
	if (position.x >= world_size_x || position.x  < 0):
		return false;
	if (position.y >= world_size_y || position.y  < 0):
		return false;
	if (position.z >= world_size_z || position.z < 0):
		return false;
	
	world[position.x][position.y][position.z] = element
	return true




func move_on_grid(position : Vector3i, size : Vector3i, element : GridElement, direction : Vector3i) -> Vector3i:
	var object_blocked = false;
	for size_x in range(size.x):
		for size_y in range(size.y):
			for size_z in range(size.z):
				var collision :GridElement= get_cell_content_world(position + Vector3i(size_x,size_y,size_z) + direction)
				if not (collision == null or collision == element or not is_instance_valid(collision)):
					print(element.name +" collided with " + collision.name)
					var receiver :Receiver = collision.get_node_or_null("MoveReceivers/" + element.prefab_name) as Receiver
					if receiver != null:
						receiver.interact(element)
					else:
						object_blocked = true;
					
	if not object_blocked:
		for size_x in range(size.x):
			for size_y in range(size.y):
				for size_z in range(size.z):
					set_cell_context_world(position + Vector3i(size_x,size_y,size_z),null)
					if not set_cell_context_world(position + Vector3i(size_x,size_y,size_z) + direction,element):
						printerr("element left the grid");
						element.queue_free()
		return position + direction
	
	return position
	
	
func convert_to_world_coordinates(grid_position : Vector3i)->Vector3:
	return grid_position;
	

func _process(delta):
	pass
