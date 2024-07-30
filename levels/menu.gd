extends Node2D

var interact_key = "interact" 

func _physics_process(_delta):
	if Input.is_action_just_pressed(interact_key):
		get_tree().change_scene_to_file("res://levels/game_level.tscn")
