extends Node

func _input(event):
	if event.is_action_pressed("cancel"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		
