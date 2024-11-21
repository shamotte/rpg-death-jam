extends Panel

@export var next_level : String

func _ready():
	if next_level == "":
		next_level = "res://scenes/main_menu.tscn"
		
func set_next_level(new_level : String):
	if new_level == "":
		new_level = "res://scenes/main_menu.tscn"
		return
	next_level = "res://scenes/level" + new_level + ".tscn"

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_next_level_pressed() -> void:
	get_tree().change_scene_to_file(next_level)
