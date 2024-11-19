extends GridElement
class_name AnvilActivator

@export var anvil: Node3D

func interact():
	anvil.set_falling(true)
	$stick_and_rope2/Rope.queue_free()
