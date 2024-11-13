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
#endregion


func _ready():
	Grid.set_grid(self)
	
	#region gthering world size (in other world monstrocity)
	
	 
	update_extents_req(self)
		
	
	min_x = abs(min_x)
	min_y = abs(min_y)
	min_z = abs(min_z)
	
	world_size_x += min_x + 1
	world_size_y += min_y + 1
	world_size_z += min_z + 1
	
	
	
	
	
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
		var grid_position : Vector3i = node.position
		world[grid_position.x + min_x][grid_position.y+ min_y][grid_position.z + min_z] = node;
		node.set_meta("test",true)


func tick_on_grid(time_steps : int):
	
	for it_x in range(world_size_x):
		for it_y in range(world_size_y):
			for it_z in range(world_size_z):
				var element:Node3D = world[it_x][it_y][it_z]
				if is_instance_valid(element):
					if element.has_method("move_time_steps"):
						element.call("move_time_steps",time_steps)
	

func deterministic_call_by_name(function_name : String, argv : Array):
	for it_x in range(world_size_x):
		for it_y in range(world_size_y):
			for it_z in range(world_size_z):
				var element:Node3D = world[it_x][it_y][it_z]
				if is_instance_valid(element):
					if element.has_method(function_name):
						element.callv(function_name,argv)


func get_cell_content(position : Vector3i):
	return world[position.x + min_x][position.y + min_y][position.z + min_z]



func _process(delta):
	pass
