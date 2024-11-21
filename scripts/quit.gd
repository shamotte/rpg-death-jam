extends Node

@export var current_level : int ##number of level which would load after pressing restart button

func _input(event):
	if event.is_action_pressed("cancel"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	if event.is_action_pressed("restart"):
		if current_level == 0:
			get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
			return
		var path = "res://scenes/level" + str(current_level) + ".tscn"
		get_tree().change_scene_to_file(path)	
	
		
