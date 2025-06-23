extends Area3D

var opened := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite3D.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Data.dialogue_opened == false and opened == true:
		opened = false
		dialogue_close()


func _on_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	$Sprite3D.visible = true


func _on_area_shape_exited(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	$Sprite3D.visible = false


func _input(event):
	if not Data.isActive:
		return
	if $Sprite3D.visible:
		if Input.is_action_just_pressed("interact"):
			Data.isActive = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			$Control.visible = true
			DialogueManager.dialogue_ended.connect(dialogue_close)
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/welcome.dialogue"), "bird")
			Data.dialogue_opened = true
			opened = true
			
			
func dialogue_close():
	$Control.visible = false
	Data.isActive = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
