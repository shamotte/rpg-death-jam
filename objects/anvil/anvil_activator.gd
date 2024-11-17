extends GridElement
class_name AnvilActivator

@export var anvil: Node3D

func interact():
	anvil.falling = true
