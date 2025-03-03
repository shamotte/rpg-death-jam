extends Node3D

@export var level_selector : Control
@export var main_menu : Control

func _ready():
	$AnimationPlayer.play("loop")
	level_selector.visible = false
	main_menu.visible = true

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level1.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_select_level_pressed() -> void:
	level_selector.visible = true
	main_menu.visible = false

func _on_exit_2_pressed() -> void:
	level_selector.visible = false
	main_menu.visible = true


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level2.tscn")


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level3.tscn")


func _on_level_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level4.tscn")


func _on_level_5_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level5.tscn")


func _on_level_6_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level6.tscn")


func _on_level_7_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level7.tscn")
