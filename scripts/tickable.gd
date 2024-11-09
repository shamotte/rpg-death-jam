extends Node
class_name tickable

signal tick(steps : int)


func progress_time(time_steps : int):
	tick.emit(time_steps)
	
	
