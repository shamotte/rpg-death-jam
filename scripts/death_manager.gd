extends Node


var living_people : Array
var started_unaliving :bool = false

signal all_dead
signal not_all_dead



func reset_counter():
	started_unaliving = false
	living_people.clear()
	
func register_victim(victim):
	living_people.append(victim)
	print("huh")
	
	
func unalive(victim):
	started_unaliving = true
	living_people.erase(victim)
	print("heee")


func check_end_condition():
	if started_unaliving:
		if living_people.is_empty():
			print("DM","wszyscy umrali na raz")
			all_dead.emit()
		else:
			print("DM","nuh uh")
			print(living_people)
			for person in living_people:
				if is_instance_valid(person):
					person.scared()
			not_all_dead.emit()
	else:
		pass
		
	




func _process(delta):
	pass
