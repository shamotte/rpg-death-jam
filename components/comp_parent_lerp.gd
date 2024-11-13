extends Node

var parent: Node3D
var parent_parent: Node3D

@export var _position: bool = true
@export var _rotation_y: bool = true
@export_range(0.0, 1.0) var lerp_speed: float = 0.25

func _ready() -> void:
	parent = get_parent()
	parent_parent = parent.get_parent()
	
	parent.top_level = true

func _physics_process(_delta: float) -> void:
	if _position:
		parent.global_position = parent.global_position.lerp(parent_parent.global_position, lerp_speed)
		
	if _rotation_y:
		parent.global_rotation.y = lerp_angle(parent.global_rotation.y, parent_parent.global_rotation.y, lerp_speed)
