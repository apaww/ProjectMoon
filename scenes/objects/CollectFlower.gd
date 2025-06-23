extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite3D.visible = false


func _on_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	if $AnimatedSprite3D.visible:
		$Sprite3D.visible = true


func _on_area_shape_exited(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	$Sprite3D.visible = false


func _input(event):
	if not Data.isActive:
		return
	if $Sprite3D.visible:
		if Input.is_action_just_pressed("interact"):
			$AnimatedSprite3D.visible = false
			Data.flower_status += 1
			$Sprite3D.visible = false
			
