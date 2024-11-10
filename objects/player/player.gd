extends Node3D

var move_tween: Tween

func _input(event):
	if event.is_action_pressed("move_left"):
		TimeManager.progres_time(1)
		if not move_tween:
			move_tween.kill()
			
		move_tween = get_tree().create_tween()
		move_tween.tween_property(self, "global_position", global_position + Vector3(-1, 0, 0), 0.25)
		move_tween.set_trans(Tween.TRANS_QUINT)
		move_tween.set_ease(Tween.EASE_OUT_IN)
			
	if event.is_action_pressed("move_right"):
		TimeManager.progres_time(1)
		if move_tween:
			move_tween.kill()
			
		move_tween = get_tree().create_tween()
		move_tween.tween_property(self, "global_position", global_position + Vector3(1, 0, 0), 0.25)
		move_tween.set_trans(Tween.TRANS_QUINT)
		move_tween.set_ease(Tween.EASE_OUT_IN)
		
	if event.is_action_pressed("move_up"):
		TimeManager.progres_time(1)
		if move_tween:
			move_tween.kill()
			
		move_tween = get_tree().create_tween()
		move_tween.tween_property(self, "global_position", global_position + Vector3(0, 0, -1), 0.25)
		move_tween.set_trans(Tween.TRANS_QUINT)
		move_tween.set_ease(Tween.EASE_OUT_IN)
		
	if event.is_action_pressed("move_down"):
		TimeManager.progres_time(1)
		if move_tween:
			move_tween.kill()
			
		move_tween = get_tree().create_tween()
		move_tween.tween_property(self, "global_position", global_position + Vector3(0, 0, 1), 0.25)
		move_tween.set_trans(Tween.TRANS_QUINT)
		move_tween.set_ease(Tween.EASE_OUT_IN)
			

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
