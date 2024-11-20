extends Control

@export var win_panel : Control
@export var lose_panel : Control

func _ready():
	win_panel.visible = false
	lose_panel.visible = false
	DeathManager.connect("all_dead",win)
	DeathManager.connect("not_all_dead",lose)

func win():
	win_panel.visible = true
	
func lose():
	lose_panel.visible = true
	
