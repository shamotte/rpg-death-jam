extends GridElement
class_name AnvilActivator

@export var anvil: Node3D

func interact():
	anvil.set_falling(true)
	if is_instance_valid($stick_and_rope2/Rope):
		$stick_and_rope2/Rope.queue_free()
