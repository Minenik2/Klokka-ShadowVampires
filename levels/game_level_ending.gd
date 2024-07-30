extends Node2D

func _ready():
	var music_manager = $"/root/BgMusic"
	if music_manager:
		music_manager.stop_music()
