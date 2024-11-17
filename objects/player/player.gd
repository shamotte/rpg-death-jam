extends GridElement
class_name Player

var can_move: bool = true

func _input(event):
	if not can_move:
		return
	
	if event.is_action_pressed("interact"):
		var temp = grid_position + Vector3i(basis.z)
		print("temp : "  + str(temp))
		print("pos : " + str(grid_position))
		
		var interacting = Grid.get_grid().get_cell_content_world(temp)
		print(interacting)
		if interacting is AnvilActivator:
			interacting.interact()
	
	if event.is_action_pressed("move_left"):
		global_rotation.y = deg_to_rad(-90)
		if Grid.get_grid().get_cell_content_world($"MovementChecks/X-".global_position) is not GroundTile:
			TimeManager.progres_time(1)
			move(Vector3(-1, 0, 0))
			update_movement_checks()
			
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Y-".global_position) is not GroundTile:
			death()
			
	if event.is_action_pressed("move_right"):
		global_rotation.y = deg_to_rad(90)
		if Grid.get_grid().get_cell_content_world($"MovementChecks/X+".global_position) is not GroundTile:
			TimeManager.progres_time(1)
			move(Vector3(1, 0, 0))
			update_movement_checks()
			
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Y-".global_position) is not GroundTile:
			death()
		
	if event.is_action_pressed("move_up"):
		global_rotation.y = deg_to_rad(180)
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Z-".global_position) is not GroundTile:
			TimeManager.progres_time(1)
			move(Vector3(0, 0, -1))
			update_movement_checks()
			
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Y-".global_position) is not GroundTile:
			death()
		
	if event.is_action_pressed("move_down"):
		global_rotation.y = deg_to_rad(0)
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Z+".global_position) is not GroundTile:
			TimeManager.progres_time(1)
			move(Vector3(0, 0, 1))
			update_movement_checks()
			
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Y-".global_position) is not GroundTile:
			death()
			pass


func death():
	$AnimationPlayer.play("death")
	can_move = false
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func update_movement_checks():
	$MovementChecks.global_position = global_position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_movement_checks()

func _physics_process(delta: float) -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
