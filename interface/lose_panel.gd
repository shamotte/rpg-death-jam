extends Panel

@export var current_level : String

func _ready():
	if current_level == "":
		current_level = "res://scenes/main_menu.tscn"

func set_current_level(cur_level : String):
	if cur_level == "0":
		cur_level = "res://scenes/main_menu.tscn"
		return
	current_level = "res://scenes/level" + cur_level + ".tscn"

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_restart_level_pressed() -> void:
	get_tree().change_scene_to_file(current_level)
