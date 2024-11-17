extends Node3D


func _ready() -> void:
	$AnimationPlayer.play("bob")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$AnimationPlayer.play("bob")
