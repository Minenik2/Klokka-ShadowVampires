extends StaticBody2D

@export var dialogue_box: CanvasLayer

func flip_switch():
	$AudioStreamPlayer2D.play()
	dialogue_box.visible = true
	visible = false
