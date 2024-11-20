extends Node


var living_people : Array
var started_unaliving :bool = false



func reset_counter():
	living_people.clear()
	
func register_victim(victim):
	if victim not in living_people:
		living_people.append(victim)
	
	
func unalive(victim):
	living_people.erase(self)
	started_unaliving = true
	


func check_end_condition():
	if started_unaliving:
		if living_people.is_empty():
			print("DM","wszyscy umrali na raz")
		else:
			print("DM","nuh uh")
	else:
		print("DM","rzeź się jeszcze nie zaczęła")
	




func _process(delta):
	pass
