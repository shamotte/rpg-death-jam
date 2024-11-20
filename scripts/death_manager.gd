extends Node


var living_people : Array
var started_unaliving :bool = false



func reset_counter():
	living_people.clear()
	
func register_victim(victim):
	living_people.append(victim)
	print("huh")
	
	
func unalive(victim):
	started_unaliving = true
	living_people.erase(self)
	


func check_end_condition():
	if started_unaliving:
		if living_people.is_empty():
			print("DM","wszyscy umrali na raz")
		else:
			print("DM","nuh uh")
	else:
		pass
		
	




func _process(delta):
	pass
