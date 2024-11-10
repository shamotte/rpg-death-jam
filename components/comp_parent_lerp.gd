extends Node

var parent: Node3D
var parent_parent: Node3D

@export_range(0.0, 1.0) var lerp_speed: float = 0.25

func _ready() -> void:
	parent = get_parent()
	parent_parent = parent.get_parent()
	
	parent.top_level = true

func _physics_process(delta: float) -> void:
	parent.global_position = parent.global_position.lerp(parent_parent.global_position, lerp_speed)
