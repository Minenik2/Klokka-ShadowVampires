extends StaticBody2D

@export var dialogue_box: CanvasLayer
@export var frame: int = 0
@export var next_scene: PackedScene

func _ready():
	$Sprite2D.frame = frame

func flip_switch():
	$AudioStreamPlayer2D.play()
	dialogue_box.visible = true
	visible = false 
	if frame == 0 || 3:
		get_tree().change_scene_to_packed(next_scene)
