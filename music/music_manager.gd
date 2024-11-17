extends Node


func _ready() -> void:
	$Music.play()


func _on_music_finished() -> void:
	$Music.play()
