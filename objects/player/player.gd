extends GridElement
class_name Player

@export var character_model : Node3D

var is_locked : bool

var can_move: bool = true
signal player_fall_down

func _input(event):
	if not can_move:
		return
	
	if event.is_action_pressed("interact"):
		var temp = grid_position + Vector3i(basis.z)
		var interacting = Grid.get_grid().get_cell_content_world(temp)
		if interacting is AnvilActivator:
			character_model.change_animation("Interact_scythe")
			#character_model.change_animation("attack_scythe")
			interacting.interact()
			TimeManager.progres_time(1)
		if interacting is Human:
			character_model.change_animation("attack_scythe")
			interacting.dead()
			TimeManager.progres_time(1)
			#character_model.change_animation("attack_scythe")
	
	if event.is_action_pressed("move_left"):
		global_rotation.y = deg_to_rad(-90)
		if Grid.get_grid().get_cell_content_world($"MovementChecks/X-".global_position) is not GroundTile:
			TimeManager.progres_time(1)
			move(Vector3(-1, 0, 0))
			update_movement_checks()
			show_tip()
			
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Y-".global_position) is not GroundTile:
			death()
			
	if event.is_action_pressed("move_right"):
		global_rotation.y = deg_to_rad(90)
		if Grid.get_grid().get_cell_content_world($"MovementChecks/X+".global_position) is not GroundTile:
			TimeManager.progres_time(1)
			move(Vector3(1, 0, 0))
			update_movement_checks()
			show_tip()
			
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Y-".global_position) is not GroundTile:
			death()
		
	if event.is_action_pressed("move_up"):
		global_rotation.y = deg_to_rad(180)
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Z-".global_position) is not GroundTile:
			TimeManager.progres_time(1)
			move(Vector3(0, 0, -1))
			update_movement_checks()
			show_tip()
			
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Y-".global_position) is not GroundTile:
			death()
		
	if event.is_action_pressed("move_down"):
		global_rotation.y = deg_to_rad(0)
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Z+".global_position) is not GroundTile:
			TimeManager.progres_time(1)
			move(Vector3(0, 0, 1))
			update_movement_checks()
			show_tip()
			
		if Grid.get_grid().get_cell_content_world($"MovementChecks/Y-".global_position) is not GroundTile:
			death()
			pass


func death():
	$AnimationPlayer.play("death")
	can_move = false
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		player_fall_down.emit()
		#get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func update_movement_checks():
	$MovementChecks.global_position = global_position

func show_tip():
	print("check1")
	var temp = grid_position + Vector3i(basis.z)
	var interacting = Grid.get_grid().get_cell_content_world(temp)
	var interacting_list = [AnvilActivator,Human]
	if interacting is AnvilActivator:
		print("check")
	if interacting is Human:
		print("check")
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_movement_checks()
	character_model.change_animation("Idle_scythe")
	DeathManager.connect("all_dead",lock_movement)
	DeathManager.connect("not_all_dead",lock_movement)

func _physics_process(delta: float) -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func lock_movement():
	can_move = false
