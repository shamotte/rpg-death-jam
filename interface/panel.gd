extends Panel

@export var next_level_path : String

func _ready():
	if next_level_path == "":
		next_level_path = "res://scenes/main_menu.tscn"

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_next_level_pressed() -> void:
	get_tree().change_scene_to_file(next_level_path)
