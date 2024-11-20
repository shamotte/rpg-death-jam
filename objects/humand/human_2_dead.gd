extends Node3D

func _ready() -> void:
	$AnimationPlayer.play("Dead")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
