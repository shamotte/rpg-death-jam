extends Panel

@export var current_level_path : String

func _ready():
	if current_level_path == "":
		current_level_path = "res://scenes/main_menu.tscn"

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_restart_level_pressed() -> void:
	get_tree().change_scene_to_file(current_level_path)
