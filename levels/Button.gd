extends Button

@export var initial_scene_path: String = "res://levels/game_level.tscn"  # Path to your initial scene

func _ready():
	connect("pressed", Callable(self, "_on_button_pressed"))

func _on_button_pressed():
	get_tree().change_scene_to_file(initial_scene_path)
