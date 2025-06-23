extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if Data.isActive:
			$Label.visible = true
			Data.isActive = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			$Label.visible = false
			Data.isActive = true
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
