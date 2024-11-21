extends Control

@export_group("Levels")
@export var current_level : int  	##number of current level
@export var next_level : int 		##Number of next level
@export var player : Node3D			##Player node used to connect fall down signal
@export_group("Nodes Inside")
@export var win_panel : Control
@export var lose_panel : Control
@export var fall_down_panel : Control
@export var anim : AnimationPlayer

func _ready():
	win_panel.set_next_level(str(next_level))
	lose_panel.set_current_level(str(current_level))
	fall_down_panel.set_current_level(str(current_level))
	win_panel.visible = false
	lose_panel.visible = false
	fall_down_panel.visible = false
	DeathManager.connect("all_dead",win)
	DeathManager.connect("not_all_dead",lose)
	player.connect("player_fall_down",fall_down)

func win():
	anim.play("show_win")
	win_panel.visible = true
	
func lose():
	anim.play("show_lose")
	lose_panel.visible = true
	
func fall_down():
	anim.play("show_fall")
	fall_down_panel.visible = true
	
