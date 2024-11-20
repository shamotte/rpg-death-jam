extends Node3D

var emotion_sprites = {
	"skull": preload("res://sprites/skull.png"),
	"shock": preload("res://sprites/shock.png")
}
@export var emotion = "skull"

func _ready() -> void:
	$Emotion.texture = emotion_sprites[emotion]
	$AnimationPlayer.play("pulse")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
