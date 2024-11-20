extends Control

@export var win_panel : Control
@export var lose_panel : Control
@export var anim : AnimationPlayer

func _ready():
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
	
