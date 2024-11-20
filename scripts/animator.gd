extends GridElement

@export var anim : AnimationPlayer
@export var current_animation : String = "Idle"

@export var reset_animation : bool = true

func _ready() -> void:
	anim.play(current_animation)

func change_animation(new_animation : String):
	current_animation = new_animation
	anim.play(current_animation)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("end anim")
	if reset_animation:
		change_animation("Idle_scythe")


func _on_dead_timer_timeout() -> void:
	pass # Replace with function body.
