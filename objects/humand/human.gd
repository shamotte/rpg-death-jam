extends GridElement
class_name Human

@export var anim : AnimationPlayer
@export var current_animation : String = "Idle"

var move_direction : Vector3i 

func _ready() -> void:
	anim.play(current_animation)
	super._ready()
	move_direction = Vector3i(basis.z)

func change_animation(new_animation : String):
	current_animation = new_animation
	anim.play(current_animation)
	
func move_time_steps(time_steps : int):
	print("H grid ",Grid.get_grid().get_cell_content_grid(Vector3i(self.position) + Vector3i(basis.z) - Vector3i(basis.y)))
	print("H grid",Grid.get_grid().get_cell_content_world(Vector3i(self.position) + Vector3i(basis.z) - Vector3i(basis.y)))
	print("H pos",grid_position + Vector3i(basis.z) - Vector3i(basis.y))
	if Grid.get_grid().get_cell_content_world(Vector3i(self.position) + Vector3i(basis.z) - Vector3i(basis.y)) is not GroundTile:
		self.rotation.y += deg_to_rad(180)
		move_direction = Vector3i(basis.z)
		move(move_direction)
	else: 
		move_direction = Vector3i(basis.z)
		move(move_direction)
			
	print(Grid.get_grid().get_cell_content_world(global_position))
	if Grid.get_grid().get_cell_content_world(global_position) is Anvil:
		change_animation("Dead")
