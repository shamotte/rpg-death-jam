extends Node3D

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
