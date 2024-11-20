extends Node3D

var top_down : bool = false
var tween : Tween

func _input(event):
	if event.is_action_pressed("camera_move"):
		if tween != null:
			tween.kill()
		tween = get_tree().create_tween()
		if !top_down: 
			tween.tween_property(self, "rotation", Vector3(deg_to_rad(-70),0,0), 0.5)
			top_down = true
			return
		#self.rotation.x = deg_to_rad(0)
		tween.tween_property(self, "rotation", Vector3(deg_to_rad(0),0,0), 0.5)
		top_down = false
		
		
