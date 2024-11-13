extends Node

@export var anim : AnimationPlayer
@export var current_animation : String = "Idle"

func _ready() -> void:
	anim.play(current_animation)

func change_animation(new_animation : String):
	current_animation = new_animation
	anim.play(current_animation)
	
	
