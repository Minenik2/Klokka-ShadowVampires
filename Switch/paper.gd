extends StaticBody2D

@export var dialogue_box: CanvasLayer
@export var frame: int = 0

func _ready():
	$Sprite2D.frame = frame

func flip_switch():
	$AudioStreamPlayer2D.play()
	dialogue_box.visible = true
	visible = false 
