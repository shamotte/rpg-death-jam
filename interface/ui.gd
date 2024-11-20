extends Control

@export_group("Levels")
@export var current_level : String
@export var next_level : String
@export_group("Nodes Inside")
@export var win_panel : Control
@export var lose_panel : Control
@export var anim : AnimationPlayer

func _ready():
	win_panel.set_next_level(next_level)
	lose_panel.set_current_level(current_level)
	win_panel.visible = false
	lose_panel.visible = false
	DeathManager.connect("all_dead",win)
	DeathManager.connect("not_all_dead",lose)

func win():
	anim.play("show_win")
	win_panel.visible = true
	
func lose():
	anim.play("show_lose")
	lose_panel.visible = true
	
