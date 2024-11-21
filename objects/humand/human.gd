extends GridElement
class_name Human

@export var anim : AnimationPlayer
@export var current_animation : String = "Idle"
@export var can_move : bool

var dead_model = preload("res://objects/humand/human_2_dead.tscn")

var move_direction : Vector3i 

func _ready() -> void:
	anim.play(current_animation)
	super._ready()
	move_direction = Vector3i(basis.z)
	
	await get_tree().process_frame
	await null
	DeathManager.register_victim(self)

func change_animation(new_animation : String):
	current_animation = new_animation
	anim.play(current_animation)
	
func move_time_steps(time_steps : int):
	if !can_move:
		return
	if Grid.get_grid().get_cell_content_world(Vector3i(self.position) + Vector3i(basis.z) - Vector3i(basis.y)) is not GroundTile:
		self.rotation.y += deg_to_rad(180)
		move_direction = Vector3i(basis.z)
		move(move_direction)
	else: 
		move_direction = Vector3i(basis.z)
		move(move_direction)
			
	print(Grid.get_grid().get_cell_content_world(global_position))

func set_moving(moving : bool):
	can_move = moving

func dead(data : Variant = null):
	DeathManager.unalive(self)
	var d = dead_model.instantiate()
	get_parent().add_child(d)
	d.global_position = global_position
	d.global_rotation = global_rotation
	queue_free()

var scared_emotion = preload("res://objects/emotion/emotion.tscn")
func scared():
	var emo = scared_emotion.instantiate()
	emo.emotion = "shock"
	add_child(emo)
	emo.global_position = global_position + Vector3(0, 2, 0)
