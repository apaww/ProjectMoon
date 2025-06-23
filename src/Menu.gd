extends Control

func _on_play_pressed() -> void:
	Data.isActive = true
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_telegram_pressed() -> void:
	OS.shell_open("https://t.me/svin_krevetka")


func _on_exit_pressed() -> void:
	get_tree().quit()
