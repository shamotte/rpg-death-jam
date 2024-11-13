extends Node3D



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
	
	
	#region gthering world size (in other world monstrocity)
	
	 
	for child : Node3D in get_children():
		var child_position = child.position;
		min_x = min(child_position.x, min_x)
		min_y = min(child_position.y, min_y)
		min_z = min(child_position.z, min_z)
		world_size_x = max(world_size_x,child_position.x)
		world_size_y = max(world_size_y,child_position.y)
		world_size_z = max(world_size_z,child_position.z)
		
	
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


	
	
	
	
	for child : Node3D in get_children():
		var grid_position : Vector3i = child.position
		
		world[grid_position.x][grid_position.y][grid_position.z] = child;
		
		
#endregion
	

	TimeManager.time_tick.connect(tick_on_grid)

	
	


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


func get_cell_content(x : int , y:int, z: int):
	return world[x][y][z]



func _process(delta):
	pass
