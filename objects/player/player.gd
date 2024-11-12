extends Node3D

var move_tween: Tween

func _input(event):
	if event.is_action_pressed("move_left"):
		TimeManager.progres_time(1)
		global_position.x -= 1
		global_rotation.y = deg_to_rad(-90)
			
	if event.is_action_pressed("move_right"):
		TimeManager.progres_time(1)
		global_position.x += 1
		global_rotation.y = deg_to_rad(90)
		
	if event.is_action_pressed("move_up"):
		TimeManager.progres_time(1)
		global_position.z -= 1
		global_rotation.y = deg_to_rad(180)
		
	if event.is_action_pressed("move_down"):
		TimeManager.progres_time(1)
		global_position.z += 1
		global_rotation.y = deg_to_rad(0)
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
	#$Visual.global_position = $Visual.global_position.lerp(global_position, 0.15)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
