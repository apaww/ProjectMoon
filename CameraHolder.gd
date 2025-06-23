extends Node3D

# Called when the node enters the scene tree for the first time.
func _input(event) -> void:
	if event is InputEventMouseMotion and Data.isActive:
		rotate_x(deg_to_rad(event.relative.y * -0.1))
