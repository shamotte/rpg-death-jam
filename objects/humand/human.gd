extends GridElement
class_name Human

@export var anim : AnimationPlayer
@export var current_animation : String = "Idle"

func _ready() -> void:
	anim.play(current_animation)
	super._ready()

func change_animation(new_animation : String):
	current_animation = new_animation
	anim.play(current_animation)
	
func move_time_steps(time_steps : int):

	print(Grid.get_grid().get_cell_content_world(global_position))
	if Grid.get_grid().get_cell_content_world(global_position) is Anvil:
		change_animation("Dead")
