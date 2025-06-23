extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control.visible = true
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/welcome.dialogue"), "bird")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
