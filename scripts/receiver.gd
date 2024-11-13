extends Node
class_name Receiver

signal interaction(Variant)


func interact(parameters):
	interaction.emit(parameters)
