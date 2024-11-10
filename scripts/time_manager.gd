extends Node


signal time_tick(int)

func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_SPACE:
			if false: progres_time(1)


func progres_time(time_steps : int):
	time_tick.emit(time_steps)
